include(../external_library/easyloggingpp/easyloggingpp/easyloggingpp.pri)
include(../libglobal/libglobal.pri)
include(../libdb/libdb.pri)

QT       += core gui widgets sql

TARGET = Turbin
TEMPLATE = app

CONFIG += c++11

macx {
    QMAKE_LIBDIR += $$OUT_PWD/../bin/Turbin.app/Contents/Frameworks
    LIBS += -framework Foundation
} else:win32 {
    LIBS += -L$$OUT_PWD/../bin
} else {
    QMAKE_LIBDIR = $$OUT_PWD/../bin $$QMAKE_LIBDIR
    LIBS += -L$$OUT_PWD/../bin
}

win32 {
    DESTDIR = ../
} else {
    DESTDIR = ../bin
}

RESOURCES += turbin.qrc

SOURCES += main.cpp \
    core.cpp \
    gui/splash.cpp \
    gui/settingdialog.cpp

HEADERS  += \
    core.h \
    gui/splash.h \
    gui/settingdialog.h

FORMS += \
    gui/splash.ui \
    gui/settingdialog.ui