include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG += thread
CONFIG += qt

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
QMAKE_CFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov

SOURCES += main.cpp \
    ../app/rsa.cpp \
    ../app/hash.cpp \
    ../app/bases.cpp

HEADERS += \
    bases_test.h \
    hash_test.h \
    rsa_test.h \
    ../app/rsa.h \
    ../app/hash.h \
    ../app/bases.h

INCLUDEPATH += ../app
