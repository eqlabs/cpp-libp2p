/**
 * Copyright Soramitsu Co., Ltd. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef LIBP2P_OUTCOME_HPP
#define LIBP2P_OUTCOME_HPP

#include <boost/outcome/result.hpp>
#include <boost/outcome/success_failure.hpp>
#include <boost/outcome/try.hpp>

// Starting from commit d33e73cf2f643f73930518cb253bf80efbca70a4 in version 1.76
// Boost Outcome doesn't add `auto&&` to a variable automatically. So we need to do it
// manually for backward-compatitbility.
#if BOOST_VERSION < 107600
#define OUTCOME_TRY(...) BOOST_OUTCOME_TRY(__VA_ARGS__)
#else
#define OUTCOME_TRY_1(x) BOOST_OUTCOME_TRY(x)
#define OUTCOME_TRY_2(x, y) BOOST_OUTCOME_TRY(auto&& x, y)
#define _GET_OUTCOME_MACRO(_1, _2, NAME, ...) NAME
#define OUTCOME_TRY(... ) _GET_OUTCOME_MACRO(__VA_ARGS__, OUTCOME_TRY_2, OUTCOME_TRY_1)(__VA_ARGS__)
#endif

#include <libp2p/outcome/outcome-register.hpp>

/**
 * __cpp_sized_deallocation macro interferes with protobuf generated files
 * and makes them uncompilable by means of clang
 * since it is not necessary outside of outcome internals
 * it can be safely undefined
 */
#ifdef __cpp_sized_deallocation
#undef __cpp_sized_deallocation
#endif

namespace libp2p::outcome {
  using namespace BOOST_OUTCOME_V2_NAMESPACE;  // NOLINT

  template <class R, class S = std::error_code,
            class NoValuePolicy = policy::default_policy<R, S, void>>  //
  using result = basic_result<R, S, NoValuePolicy>;

}  // namespace outcome

// @see /docs/result.md

#endif  // LIBP2P_OUTCOME_HPP
