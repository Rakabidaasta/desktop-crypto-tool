TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG += qt
QT += quick
LIBS += -lgmp -lgcov

SOURCES += \
        bases.cpp \
        hash.cpp \
        main.cpp \
        rsa.cpp

RESOURCES += qml.qrc

HEADERS += \
    bases.h \
    hash.h \
    rsa.h

#QMAKE_CFLAGS += -Wall -Wextra -Werror

# gcov
QMAKE_CFLAGS += -fprofile-arcs -ftest-coverage
