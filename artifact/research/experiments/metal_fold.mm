#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#include <bit>
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <vector>

struct Query { uint32_t offset, length; float initial, expected; };
static_assert(sizeof(Query) == 16 && std::endian::native == std::endian::little);

int main(int argc, char** argv) {
    @autoreleasepool {
        if (argc != 3 && argc != 4) return 2;
        std::ifstream stream(argv[2], std::ios::binary);
        uint32_t lengths[2] = {};
        stream.read(reinterpret_cast<char*>(lengths), sizeof(lengths));
        if (!stream || !lengths[0] || !lengths[1] || lengths[0] > (1u << 18) || lengths[1] > (1u << 18)) return 3;
        std::vector<float> values(lengths[0]);
        std::vector<Query> queries(lengths[1]);
        stream.read(reinterpret_cast<char*>(values.data()), values.size() * sizeof(float));
        stream.read(reinterpret_cast<char*>(queries.data()), queries.size() * sizeof(Query));
        if (!stream) return 4;
        for (const Query& q : queries)
            if (q.length > 1024 || q.offset > values.size() || q.length > values.size() - q.offset) return 5;
        id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        if (!device) { std::fprintf(stderr, "Metal device unavailable\n"); return 6; }
        NSError* error = nil;
        NSString* source = [NSString stringWithContentsOfFile:[NSString stringWithUTF8String:argv[1]] encoding:NSUTF8StringEncoding error:&error];
        if (!source) return 7;
        MTLCompileOptions* options = [MTLCompileOptions new];
        options.languageVersion = MTLLanguageVersion3_1;
        options.mathMode = MTLMathModeSafe;
        id<MTLLibrary> library = [device newLibraryWithSource:source options:options error:&error];
        id<MTLComputePipelineState> pipeline = library ? [device newComputePipelineStateWithFunction:[library newFunctionWithName:@"ordered_float"] error:&error] : nil;
        if (!pipeline) { std::fprintf(stderr, "%s\n", error.description.UTF8String); return 8; }
        id<MTLBuffer> data = [device newBufferWithBytes:values.data() length:values.size()*sizeof(float) options:MTLResourceStorageModeShared];
        id<MTLBuffer> tasks = [device newBufferWithBytes:queries.data() length:queries.size()*sizeof(Query) options:MTLResourceStorageModeShared];
        id<MTLBuffer> output = [device newBufferWithLength:queries.size()*sizeof(float) options:MTLResourceStorageModeShared];
        id<MTLCommandQueue> queue = [device newCommandQueue];
        if (!data || !tasks || !output || !queue) return 9;
        id<MTLCommandBuffer> command = [queue commandBuffer];
        id<MTLComputeCommandEncoder> encoder = [command computeCommandEncoder];
        [encoder setComputePipelineState:pipeline];
        [encoder setBuffer:data offset:0 atIndex:0];
        [encoder setBuffer:tasks offset:0 atIndex:1];
        [encoder setBuffer:output offset:0 atIndex:2];
        [encoder setBytes:&lengths[1] length:sizeof(lengths[1]) atIndex:3];
        [encoder dispatchThreads:MTLSizeMake(queries.size(),1,1) threadsPerThreadgroup:MTLSizeMake(32,1,1)];
        [encoder endEncoding];
        [command commit];
        [command waitUntilCompleted];
        if (command.status != MTLCommandBufferStatusCompleted) return 10;
        auto* actual = static_cast<const float*>(output.contents);
        unsigned mismatches = 0, changed = 0;
        std::vector<uint32_t> bits(queries.size());
        for (size_t i=0; i<queries.size(); ++i) {
            bits[i] = std::bit_cast<uint32_t>(actual[i]);
            if (bits[i] != std::bit_cast<uint32_t>(queries[i].expected)) ++mismatches;
            changed += actual[i] != queries[i].initial;
        }
        std::ofstream raw(argc == 4 ? argv[3] : "results/raw/metal_outputs.bin", std::ios::binary);
        raw.write(reinterpret_cast<const char*>(bits.data()), bits.size()*sizeof(uint32_t));
        if (!raw) return 11;
        std::printf("{\"device\":\"%s\",\"queries\":%zu,\"mismatches\":%u,\"nonidentity_results\":%u,"
                    "\"buffer_bytes\":%lu,\"math_mode\":\"MTLMathModeSafe\",\"scope\":\"actual GPU FP32 sequential folds\"}\n",
                    device.name.UTF8String, queries.size(), mismatches, changed,
                    (unsigned long)(data.length+tasks.length+output.length));
        return mismatches ? 12 : 0;
    }
}
