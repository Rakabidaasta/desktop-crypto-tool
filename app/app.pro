TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG += qt
QT += quick
LIBS += -lgmp -lgcov

SOURCES += \
        code/bases.cpp \
        code/hash.cpp \
        code/main.cpp \
        code/rsa.cpp

RESOURCES += qml.qrc

HEADERS += \
    code/bases.h \
    code/hash.h \
    code/rsa.h

#QMAKE_CFLAGS += -Wall -Wextra -Werror

# gcov
QMAKE_CFLAGS += -fprofile-arcs -ftest-coverage
