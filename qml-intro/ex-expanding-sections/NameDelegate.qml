/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Text {
    clip: true // Necesario para que no se vea
    text: model.name;
    font.pixelSize: 24

    property bool expanded: false

    height: expanded ? implicitHeight : 0
    /*Agregado para copiar a Android*/
    visible: height == implicitHeight ? true: false


    /* Hace que colapse lentamente, básicamente
    es la mejor forma de hacerlo*/
    Behavior on height {
        NumberAnimation { duration:  100 }
    }

    /*Agregado para copiar a Android*/
    NumberAnimation on opacity {
        running: visible
        from: 0
        to: 1
        duration: 200
    }
}
