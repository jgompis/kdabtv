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


Rectangle {

    /*Propiedad personalizada*/
    //property string text: textInput.text // binding con la del TextInput
    /* evita romper el binding para acceder a la propiedad del hijo
    sería algo así como una herencia*/
    property alias text: textInput.text

    /*En caso de no tener que acceder a una propiedad de un elemento
    hijo y necesitar una propiedad personalizada, se puede agregar
    como una propiedad personalizada de manera clásica*/
    property int diameter: 8


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
