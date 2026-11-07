#include <metal_stdlib>
using namespace metal;
struct Query { uint offset; uint length; float initial; float expected; };
kernel void ordered_float(device const float* values [[buffer(0)]],
                          device const Query* queries [[buffer(1)]],
                          device float* results [[buffer(2)]],
                          constant uint& count [[buffer(3)]],
                          uint tid [[thread_position_in_grid]]) {
    if (tid >= count) return;
    const Query q = queries[tid];
    float state = q.initial;
    for (uint i = 0; i < q.length; ++i) state = state + values[q.offset + i];
    results[tid] = state;
}
