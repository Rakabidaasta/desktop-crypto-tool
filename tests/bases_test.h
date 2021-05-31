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

TEST(bases, clipboard_test)
{
    int argc = 0;
    char* argv[0];

    QGuiApplication app(argc, argv);
    Bases bases;

    bases.set_to_clipboard("hello");
    QString res = bases.get_from_clipboard();
    EXPECT_STREQ(res.toStdString().c_str(), "hello");
}



#endif // BASES_TEST_H
