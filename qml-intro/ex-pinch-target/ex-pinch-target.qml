/*************************************************************************
 *
 * Copyright (c) 2015-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Flickable {
    id: flick
    width: 400; height: 400
    contentWidth: 2000; contentHeight: 2000

    PinchArea {
        anchors.fill: parent // Llena el elemento padre
        pinch.target: img // Elemento para hacer pinch, en este caso img
        /*Escala mínima y máxima, para no poder realizar el pinch.
        por fuera de estos límites*/
        pinch.maximumScale: 1.0
        pinch.minimumScale: 0.1
        /*Indica en que ejes se puede realizar el pinch*/
        pinch.dragAxis: Pinch.XAndYAxis
    }

    Image {
        id: img
        width: flick.contentWidth
        height: flick.contentHeight
        source: "../images/rocket.svg"
    }
}

