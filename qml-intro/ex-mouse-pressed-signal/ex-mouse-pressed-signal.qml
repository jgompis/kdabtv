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
    width: 400; height: 300;
    color: "lightblue"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40
        height: parent.height / 2
        text: "Press me"
        font.pixelSize: 48

        MouseArea {
            anchors.fill: parent

            /*Cambios al presionar y soltar*/
            onPressed: parent.color = "green" // Usando asignación
            onReleased: parent.color = "black"
            /*Probando hover*/
            //acceptedButtons: Qt.RightButton
            //hoverEnabled: true
            //onHoveredChanged: parent.color = Qt.colorEqual(parent.color, "black")? "red" : "black"
            //hoverEnabled: true
            //onHoveredChanged: parent.color= containsMouse?  "green" : "black"
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 2 + 40
        height: parent.height / 2
        text: "Click me"
        font.pixelSize: 48

        // Area donde toma las acciones
        MouseArea {
            /*Por defecto es cero, por lo que se debe
            indicar el tamaño */
            anchors.fill: parent
            onClicked: parent.font.bold = !parent.font.bold
        }
    }
}
