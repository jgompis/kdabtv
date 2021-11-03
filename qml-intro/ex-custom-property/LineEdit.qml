/*************************************************************************
 *
 * Copyright (c) 2010-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0


Item {
    property alias text:        textInput.text
    property alias diameter:    rectangulo.diameter

    Rectangle {

        id: rectangulo
        property int diameter: 8
        anchors.fill: parent
        border.color: "green"
        color: "white"
        radius: diameter/2; smooth: true
        clip: true

        TextInput {
            id: textInput
            anchors.fill: parent
            anchors.margins: 2
            text: "Enter text..."
            color: focus ? "black" : "gray"
            font.pixelSize: parent.height - 4
        }
    }
}
