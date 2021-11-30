QT += qml quick

#agregado en sources
SOURCES += cpp/main.cpp \
    cpp/randomtimer.cpp

#agregado en headers
HEADERS += \
    cpp/randomtimer.h

RESOURCES += \
    resources.qrc

OTHER_FILES += main.qml

DISTFILES += \
    pyqt/main.py \
    pyqt/randomtimer.py \
    pyside/main.py \
    pyside/randomtimer.py
