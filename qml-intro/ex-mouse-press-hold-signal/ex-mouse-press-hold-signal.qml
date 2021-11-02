/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    width: 500; height: 200; color: "lightblue"

    Text {
        anchors.centerIn: parent
        text: "Press and hold me"; font.pixelSize: 48

        property bool isActive: false
        color: isActive ? "green" : "black"

        MouseArea {
            anchors.fill: parent
            /*Simplemente se usa este signal handler del
            elemento MouseArea para manejar el Press and Hold*/
            onPressAndHold: parent.isActive = !parent.isActive
        }
    }
}
