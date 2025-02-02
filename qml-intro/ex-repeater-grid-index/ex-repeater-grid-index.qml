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
    width: 400; height: 400; color: "black"

    Grid {
        x: 5; y: 5
        rows: 5; columns: 5; spacing: 10

        Repeater {
            model: 24
            /*Repite un rectangulo con una property binding
            lo que hace que se cambie el texto para cada uno.
            Se aprecia que la grilla se va llenando por fila
            y de derecha a izquierda*/
            Rectangle {
                width: 70; height: 70
                color: "lightgreen"
                Text {
                    anchors.centerIn: parent
                    text: model.index
                    font.pointSize: 30
                }
            }
        }
    }
}
