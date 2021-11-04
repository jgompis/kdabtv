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
    id: window
    color: "black"
    width: 500
    height: 500

    //--> slide
    /**/
    Flipable {
        id: flipable
        anchors.centerIn: parent
        property bool flipped: false

        /*Parte frontal del rectangulo*/
        front: Rectangle { //--> collapse
            color: "green"
            width: 100
            height: 100
            anchors.centerIn: parent
        } //<-- collapse
        /*Parte trasera del rectangulo*/
        back: Rectangle { //--> collapse
            color: "red"
            width: 100
            height: 100
            anchors.centerIn: parent
        } //<-- collapse

        /*Animación de flip para que rote
        alrededor del eje x */
        transform: Rotation {
            axis.x: 1; axis.y: 0; axis.z: 0
            angle: flipable.flipped ? 180 : 0

            /*Behavior en el ángulo, para que
            este cambie según la animación*/
            Behavior on angle {
                NumberAnimation { duration: 500 }
            }
        }
    }

    /*Imprime de que lado se encuentra*/
    Text {
        text: flipable.side == Flipable.Front? "Front" : "Back"
        color: "white"
        anchors.bottom: parent.bottom
    }

    //<-- slide
    MouseArea {
        anchors.fill: parent
        onClicked: flipable.flipped = !flipable.flipped
    }
}
