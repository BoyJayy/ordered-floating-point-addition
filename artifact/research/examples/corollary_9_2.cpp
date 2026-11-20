// A complete binary32 example for Corollary 9.2. Build with
// clang++ -std=c++20 -O2 -ffp-model=strict corollary_9_2.cpp -o example
#include <bit>
#include <cfenv>
#include <cstdint>
#include <cstdio>
#include <limits>

static_assert(std::numeric_limits<float>::is_iec559 &&
              std::numeric_limits<float>::digits == 24 && sizeof(float) == 4);
using Rank = std::uint32_t;
constexpr Rank zero_rank = 0x7f7fffff;
constexpr Rank end_rank = 2u * zero_rank + 1u;

float value_at(Rank rank) {
    const Rank bits = rank < zero_rank
        ? 0x80000000u | (zero_rank - rank)
        : rank - zero_rank;
    return std::bit_cast<float>(bits);
}

template<class Predicate>
Rank first_output(Predicate meets_target) {
    Rank lo = 0, hi = end_rank;
    while (lo < hi) {
        const Rank mid = lo + (hi - lo) / 2;
        const float y = value_at(mid) + 1.0f;
        if (meets_target(y)) hi = mid;
        else lo = mid + 1;
    }
    return lo;
}

int main() {
    if (std::fesetround(FE_TONEAREST) || std::fegetround() != FE_TONEAREST) return 2;
    const Rank lo = first_output([](float y) { return y >= 1.0f; });
    const Rank hi = first_output([](float y) { return y > 1.0f; });
    if (lo == 0 || hi == end_rank || lo >= hi) return 1;
    std::printf("[%u, %u), %u inputs, endpoints %a and %a\n",
                lo, hi, hi - lo, double(value_at(lo)), double(value_at(hi-1)));
    return !(lo == 1283457023u && hi == 3003121664u &&
             value_at(lo) == -0x1p-25f && value_at(hi-1) == 0x1p-24f &&
             value_at(lo-1) + 1.0f < 1.0f && value_at(hi) + 1.0f > 1.0f);
}
