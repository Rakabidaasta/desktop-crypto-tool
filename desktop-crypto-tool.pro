TEMPLATE = subdirs

CONFIG -= app_bundle
CONFIG += qt

QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage -O0

SUBDIRS = app tests

CONFIG += ordered

