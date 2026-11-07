#pragma STDC FENV_ACCESS ON
#include <algorithm>
#include <bit>
#include <cfenv>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <limits>
#include <random>
#include <set>
#include <vector>

template<class T>
__attribute__((noinline)) T ordered_fold(T initial, const std::vector<T>& block) {
    volatile T state = initial;
    for (T value : block) state = static_cast<T>(state + value);
    return state;
}

template<class T, unsigned precision>
void validate(const char* label, std::mt19937_64& rng) {
    const uint64_t R = uint64_t(1) << precision;
    const uint64_t count = R / 4 - 2;
    uint64_t tested = 0, blocks = 0, distinct = 0;
    const auto started = std::chrono::steady_clock::now();
    for (unsigned requested : {0u, 1u, 2u, 8u, 32u, 128u, 512u}) {
        const unsigned n = static_cast<unsigned>(std::min<uint64_t>(requested, count));
        for (unsigned trial = 0; trial < 4; ++trial) {
            std::set<uint64_t> chosen;
            while (chosen.size() < n) chosen.insert(8 + 4 * (rng() % count));
            std::vector<uint64_t> thresholds(chosen.begin(), chosen.end());
            std::vector<T> block;
            for (unsigned i = 0; i < n; ++i) {
                const uint64_t r = R + (i % 2 == 0 ? 1 : 4) - thresholds[i];
                block.push_back(static_cast<T>(r));
                block.push_back(static_cast<T>(-static_cast<int64_t>(r)));
            }
            // Explicit equal-length padding is neutral on every tested state.
            block.resize(1024, T(0));
            if (ordered_fold(T(0), block) != T(0)) std::abort();
            std::vector<uint64_t> markers{8, R - 4};
            for (auto t : thresholds) {
                markers.push_back(t);
                if (t > 8) markers.push_back(t - 4);
                if (t + 4 < R) markers.push_back(t + 4);
            }
            for (unsigned q = 0; q < 512; ++q) markers.push_back(8 + 4 * (rng() % count));
            for (auto x : markers) {
                const auto prefix = std::upper_bound(thresholds.begin(), thresholds.end(), x) - thresholds.begin();
                const uint64_t expected = x - (prefix % 2);
                const T actual = ordered_fold(static_cast<T>(x), block);
                if (actual != static_cast<T>(expected)) {
                    std::fprintf(stderr, "%s mismatch x=%llu expected=%llu got=%.17g\n", label,
                                 (unsigned long long)x, (unsigned long long)expected, double(actual));
                    std::exit(1);
                }
                ++tested;
                distinct += expected != x;
            }
            ++blocks;
        }
    }
    const auto ns = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::steady_clock::now() - started).count();
    std::printf("{\"format\":\"%s\",\"precision\":%u,\"blocks\":%llu,\"queries\":%llu,"
                "\"nonidentity_results\":%llu,\"failures\":0,\"elapsed_ns\":%lld,"
                "\"rounding\":\"FE_TONEAREST\",\"scope\":\"actual CPU ordered arithmetic\"}\n",
                label, precision, (unsigned long long)blocks, (unsigned long long)tested,
                (unsigned long long)distinct, (long long)ns);
}

int main() {
    static_assert(std::numeric_limits<float>::is_iec559 && std::numeric_limits<double>::is_iec559);
    static_assert(std::numeric_limits<float>::digits == 24 && std::numeric_limits<double>::digits == 53);
    if (std::fesetround(FE_TONEAREST) != 0 || std::fegetround() != FE_TONEAREST) return 2;
    std::mt19937_64 rng(20261107);
    validate<_Float16, 11>("binary16, rounded after every addition", rng);
    validate<float, 24>("binary32", rng);
    validate<double, 53>("binary64", rng);
}
