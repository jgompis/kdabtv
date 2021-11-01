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
    width: 400; height: 400
    color: "#00a3fc"

    Rectangle {
        color: "red"
        width: image.width; height: image.height
        x: 150; y: 150


        Image {
            id: image
            source: "../images/rocket.png"
            /*La transformación de escalado no modifica
            el tamaño del item, modifica el tamaño a los
            ojos de quien que se encuentra mirando el elemento*/
            scale: 2.0
        }
    }
}
