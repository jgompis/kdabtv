/*************************************************************************
 *
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
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
        y: 25
        height: 50; width: 50
        /*La parte derecha del rectángulo hijo se encuentra
        alineada con la parte derecha del rectangulo
        padre, es por ello que no es necesario establecer x*/
        anchors.right: background.right

    }
}

