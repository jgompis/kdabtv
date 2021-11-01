/*************************************************************************
 *
 * Copyright (c) 2017-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

// requires Qt 5.9 or we'll hit https://bugreports.qt.io/browse/QTBUG-62913
import QtQuick 2.9

Rectangle {
    id: root
    width: 400; height: 350
    color: "#00a3fc"

//--> slide
    /*Imagen animada*/
    AnimatedImage {
        id: animation

        x: 100; y: 50
        width: 200; height: 200

        source: "../images/image-animated.gif"
    }
//<-- slide

    /*Rectangulo negro de carga*/
    Rectangle {
        x: 100; y: 260; width: 200; height: 24
        color: "black"

        /*Rectangulo rojo que se mueve*/
        Rectangle {
            width: 4; height: 24
            color: "red"

            x: (parent.width - width) * animation.currentFrame / animation.frameCount
        }

        Text {
            text: "Frame %1 of %2".arg(animation.currentFrame).arg(animation.frameCount)
            color: "white"
            font.pixelSize: 18
        }
    }
}
