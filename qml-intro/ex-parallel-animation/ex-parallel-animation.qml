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
    width: 200; height: 200; color: "#000040"

    Image {
        id: rocket
        anchors.centerIn: parent
        source: "../images/rocket.png"
    }

    /*Ejecuta las dos animaciones en paralelo
    por lo que en este caso es posible animar
    tanto la escala como la opacidad*/
    ParallelAnimation {
        NumberAnimation {
            target: rocket; properties: "scale"
            from: 0.5; to: 1.0; duration: 1000
        }
        NumberAnimation {
            target: rocket; properties: "opacity"
            from: 0.0; to: 1.0; duration: 1000
        }
        running: true
    }
}
