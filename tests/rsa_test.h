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

TEST(rsa, zero)
{
    RSA rsa;

    long res = rsa.solve_rsa(0, 0, 0, 10);
    EXPECT_EQ(res, -1);
}

TEST(rsa, prime)
{
    RSA rsa;

    bool res = rsa.IsPrime(10);
    EXPECT_FALSE(res);

    res = rsa.IsPrime(11);
    EXPECT_TRUE(res);

    res = rsa.IsPrime(-10);
    EXPECT_FALSE(res);
}

TEST(rsa, coprime_d)
{
    RSA rsa;

    long res = rsa.calculateD(6, 10);
    EXPECT_EQ(res, -1);
}

TEST(rsa, coprime_d_zero)
{
    RSA rsa;

    long res = rsa.calculateD(0, -10);
    EXPECT_EQ(res, -1);
}

#endif // RSA_TEST_H
