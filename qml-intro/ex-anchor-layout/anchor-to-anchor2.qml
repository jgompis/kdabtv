/*************************************************************************
 *
 * Copyright (c) 2018-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    id: background
    width: 300; height: 100
    color: "lightblue"

    Rectangle {
        color: "green"
        /*Los anchors sobreescriben las propiedades
        básicas*/
        y: 25 //overwritten by the top anchor
        height: 50; width: 50
        /*También se pueden formatear de esta manera*/
        anchors{
            right: background.right
            top: background.top
        }
    }
}
