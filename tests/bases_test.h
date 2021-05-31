#ifndef BASES_TEST_H
#define BASES_TEST_H

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "../app/bases.h"
#include <QClipboard>
#include <QGuiApplication>

#include<iostream>

TEST(bases, example)
{
    Bases bases;

    QList<QString> res = bases.bases_encode("lalala");

    EXPECT_STREQ(res[0].toUpper().toStdString().c_str(), "6C616C616C61");
    EXPECT_STREQ(res[1].toStdString().c_str(), "NRQWYYLMME======");
    EXPECT_STREQ(res[2].toStdString().c_str(), "bGFsYWxh");
}



#endif // BASES_TEST_H
