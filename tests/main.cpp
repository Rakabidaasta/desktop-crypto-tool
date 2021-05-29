#include <gtest/gtest.h>

#include "rsa_test.h"
#include "hash_test.h"
#include "bases_test.h"

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
