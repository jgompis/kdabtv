/*************************************************************************
 *
 * Copyright (c) 2015-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    color: "black"
    /*Para evitar el loop se usan las propiedades implicitas*/
    implicitHeight: child.implicitHeight
    implicitWidth: child.implicitWidth
    //width: child.width
    //height: child.height

    Image {
        id: child
        source : "../images/vertical-gradient.png"
        anchors.fill: parent
        anchors.margins: 5
    }
}

