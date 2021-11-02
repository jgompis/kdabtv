/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.7

/*En este ejemplo se cuenta con dos entradas
de texto. Al presionar TAB se pasa de una a la otra y
al presionar shift+TAB se vuelve a la anterior
aunque en este caso con dos elementos es lo mismo*/

Rectangle {
    width: 200; height: 112; color: "lightblue"

    TextInput {
        anchors.left: parent.left; y: 16
        anchors.right: parent.right
        text: "Field 1"; font.pixelSize: 32
        /*Dependiendo de si se encuentra enfocado,
        el texto se pone en negro o gris.*/
        color: activeFocus ? "black" : "gray"
        focus: true
        /*Permite navegar usando TAB*/
        activeFocusOnTab: true
    }
    TextInput {
        anchors.left: parent.left; y: 64
        anchors.right: parent.right
        text: "Field 2"; font.pixelSize: 32
        color: activeFocus ? "black" : "gray"
        activeFocusOnTab: true
    }
}
