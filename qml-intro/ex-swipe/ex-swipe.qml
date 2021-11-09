/*************************************************************************
 *
 * Copyright (c) 2014-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0
//--> slide
ListView {
    width: 200; height: 200
    /*Para que solo mueva un ítem*/
    snapMode: ListView.SnapOneItem
    /*Sentido horizontal*/
    orientation: ListView.Horizontal

    model: ListModel {
        ListElement { name: "One"; color: "red" }
        ListElement { name: "Two"; color: "green" }
        ListElement { name: "Three"; color: "blue" }
    }

    delegate: Rectangle {
        color: model.color
        /*El truco es hace que ocupe todo el ancho de la lista*/
        width: ListView.view.width
        height: ListView.view.height

        Text {
            anchors.centerIn: parent
            text: model.name
            //--> hide
            color: "white"
            font.pixelSize: 24
            font.bold: true
            //<-- hide
        }
    }
}
//<-- slide
