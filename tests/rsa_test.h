#ifndef RSA_TEST_H
#define RSA_TEST_H

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "../app/rsa.h"

TEST(rsa, prime_p)
{
    RSA rsa;

    long res = rsa.solve_rsa(62, 53, 17, 3);
    EXPECT_EQ(res, -1);
}

TEST(rsa, prime_q)
{
    RSA rsa;

    long res = rsa.solve_rsa(61, 52, 17, 3);
    EXPECT_EQ(res, -1);
}

TEST(rsa, prime_e)
{
    RSA rsa;

    long res = rsa.solve_rsa(61, 53, 10, 3);
    EXPECT_EQ(res, -1);
}

TEST(rsa, example)
{
    RSA rsa;

    long res = rsa.solve_rsa(61, 53, 17, 2790);
    EXPECT_EQ(res, 65);
}

#endif // RSA_TEST_H
