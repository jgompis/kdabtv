/*************************************************************************
 *
 * Copyright (c) 2010-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.12

Rectangle {
    id: carlos
    border.color: "green"
    color: "white"
    radius: 4; smooth: true
    clip: true

    /*propiedad personalizada para poder
    acceder a los campos del TextInput*/
    property string text: son.text

    TextInput {
        id: son
        anchors.fill: parent
        anchors.margins: 2
        text: "Enter text..."
        color: focus ? "black" : "gray"
        font.pixelSize: parent.height - 4

    }
}
