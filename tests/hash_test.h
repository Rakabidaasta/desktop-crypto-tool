#ifndef HASH_TEST_H
#define HASH_TEST_H

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "../app/hash.h"

TEST(hash, default)
{
    Hash hash;

    QString res = hash.check_hash("5d41402abc4b2a76b9719d911017c592");
    EXPECT_STREQ(res.toStdString().c_str(), "hello");
}

TEST(hash, short_hash)
{
    Hash hash;

    QString res = hash.check_hash("5d41402abc4b2a76b9719d911017c59");
    EXPECT_STREQ(res.toStdString().c_str(), "Это не MD5 хэш!");
}

TEST(hash, long_hash)
{
    Hash hash;

    QString res = hash.check_hash("5d41402abc4b2a76b9719d911017c592f");
    EXPECT_EQ(res, "Это не MD5 хэш!");
}

TEST(hash, nothing_find)
{
    Hash hash;

    QString res = hash.check_hash("5d41402abc4b2a76b9719d911017c593");
    EXPECT_EQ(res, "Ничего не нашлось :(");
}


#endif // HASH_TEST_H
