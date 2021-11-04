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
    width: 400; height: 400;
    color: "lightblue"

    Rectangle {
        id: rectangle1
        x: 150; y: 150
        width: 100
        height: 100
        color: "green"
    }

    /*Anima el color desde el valor inicial
    al valor final en 1000ms, al igual que
    en ejemplos anteriores arranca apenas
    se ejecuta el programa, pero es trivial
    cambiar este comportamiento*/
    ColorAnimation {
        target: rectangle1
        property: "color"
        from: Qt.rgba(0,0.5,0,1)
        to: Qt.rgba(1,1,1,1)
        duration: 1000
        running: true
    }
}
