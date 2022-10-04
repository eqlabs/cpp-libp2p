#
# Copyright Soramitsu Co., Ltd. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0
#

if (TESTING)
  add_3rdparty(GTest)
endif()
find_package(Threads)
add_3rdparty(Boost)
add_3rdparty(Microsoft.GSL)
add_3rdparty(OpenSSL)
add_3rdparty(Protobuf)

add_3rdparty(c-ares)
add_3rdparty(fmt)
add_3rdparty(yaml-cpp)
add_3rdparty(soralog)
add_3rdparty(tsl_hat_trie)
add_3rdparty(Boost.DI)
add_3rdparty(SQLiteModernCpp)
