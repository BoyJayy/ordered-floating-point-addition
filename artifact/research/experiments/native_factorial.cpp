#pragma STDC FENV_ACCESS ON
#include <algorithm>
#include <cfenv>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <numeric>
#include <random>
#include <vector>

template<class T>
__attribute__((noinline)) T fold(T x, const std::vector<T>& a, T lower, T upper) {
    volatile T s = x;
    for (T v : a) {
        s = static_cast<T>(s + v);
        if (!(s >= lower && s < upper)) std::abort();
    }
    return s;
}

template<class T, unsigned p>
void check(std::mt19937_64& rng) {
    const uint64_t R = uint64_t(1) << p;
    uint64_t queries = 0, blocks = 0, nonidentity = 0;
    for (unsigned k : {1u,2u,4u,5u,8u,32u,64u,128u}) {
        if (64ull*k*k > R) continue;
        std::vector<unsigned> permutation(k);
        std::iota(permutation.begin(), permutation.end(), 0);
        std::vector<T> reference_multiset;
        for (unsigned trial=0; trial<8; ++trial) {
            if (trial) std::shuffle(permutation.begin(), permutation.end(), rng);
            std::vector<T> a;
            std::vector<uint64_t> thresholds;
            for (unsigned j=0; j<k; ++j) {
                const uint64_t s = R/16 + 4*permutation[j];
                const uint64_t t = 13*R/16 + 4ull*k*(j+1);
                const uint64_t r = R + (j%2 ? 4 : 1) - t;
                a.insert(a.end(), {T(s),T(r),T(-static_cast<int64_t>(r)),T(-static_cast<int64_t>(s))});
                thresholds.push_back(t-s);
            }
            if (!std::is_sorted(thresholds.begin(),thresholds.end())) std::abort();
            auto multiset = a;
            std::sort(multiset.begin(),multiset.end());
            if (!trial) reference_multiset=multiset;
            if (multiset!=reference_multiset) std::abort();
            a.resize(512,T(0));
            // Separate from positive witness-state test: zero follows exact pairs.
            volatile T zero=T(0);
            for (T v:a) zero=static_cast<T>(zero+v);
            if (zero!=T(0)) std::abort();
            std::vector<uint64_t> markers{3*R/4+4,3*R/4+4ull*k*k};
            for (auto t:thresholds) {
                markers.push_back(t);
                if(t>3*R/4+4) markers.push_back(t-4);
                if(t<3*R/4+4ull*k*k) markers.push_back(t+4);
            }
            for(unsigned q=0;q<256;++q) markers.push_back(3*R/4+4*(1+rng()%(uint64_t(k)*k)));
            for(auto x:markers) {
                if(x>3*R/4+4ull*k*k) std::abort();
                auto crossed=std::upper_bound(thresholds.begin(),thresholds.end(),x)-thresholds.begin();
                const uint64_t expected=x-(crossed%2);
                const T actual=fold(T(x),a,T(R/2),T(2*R));
                if(actual!=T(expected)) std::abort();
                ++queries; nonidentity+=expected!=x;
            }
            ++blocks;
        }
    }
    std::printf("{\"precision\":%u,\"blocks\":%llu,\"queries\":%llu,\"mismatches\":0,\"nonidentity_results\":%llu,\"same_multiset\":true,\"two_binades\":true,\"scope\":\"actual CPU factorial witness\"}\n",p,(unsigned long long)blocks,(unsigned long long)queries,(unsigned long long)nonidentity);
}

int main(){
    if(std::fesetround(FE_TONEAREST)!=0 || std::fegetround()!=FE_TONEAREST) return 2;
    std::mt19937_64 rng(711202607);
    check<_Float16,11>(rng); check<float,24>(rng); check<double,53>(rng);
}
