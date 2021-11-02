/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

//--> slide
import QtQuick 2.0

Rectangle {
    width: 1000; height: 1000;
    color: "lightblue"

    MultiPointTouchArea {
        anchors.fill: parent // Llena todo el rectangulo superior
        minimumTouchPoints: 1
        maximumTouchPoints: 3

        /*Lista de elementos*/
        touchPoints: [
            TouchPoint { id: touch1 },
            TouchPoint { id: touch2 },
            TouchPoint { id: touch3 }
        ]
    }

    Rectangle {
        /*Ubica el rectangulo donde se ha presionado
        el boton*/
        x: touch1.x - width/2; y: touch1.y - height/2
        width: 200; height: 200
        /*Solo es visible si se encuentra presionado el tactil*/
        visible: touch1.pressed
        color: "cyan"
    }
    Rectangle {//--> collapse
        x: touch2.x - width/2; y: touch2.y - height/2
        width: 200; height: 200
        visible: touch2.pressed
        color: "blue"
    }//<-- collapse
    Rectangle {//--> collapse
        x: touch3.x - width/2; y: touch3.y - height/2
        width: 200; height: 200
        visible: touch3.pressed
        color: "red"
    }//<-- collapse
}
//<-- slide
