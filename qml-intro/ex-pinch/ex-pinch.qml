/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Flickable {
    id: flick
    width: 400; height: 400
    contentWidth: 1000; contentHeight: 1000
    onContentWidthChanged: console.log(contentWidth)

    PinchArea {
        width: Math.max(flick.contentWidth, flick.width)
        height: Math.max(flick.contentHeight, flick.height)

        /*propiedades personalizadas, se comportan como si
        fuesen variables locales*/
        property real initialWidth
        property real initialHeight

        /*Signal Handler para cuando empieze la acción
        de pinch. En este caso almacena el tamaño del contenido*/
        onPinchStarted: { initialWidth = flick.contentWidth
                          initialHeight = flick.contentHeight }

        /*Signal Handler para cuando se cambia el tamaño del pinch.
        En este caso "pinch" es un parametro que viene desde
        onPinchUpdated y que tiene una señal y se utiliza para
        cambiar el tamaño del contenido del flickable*/
        onPinchUpdated: flick.resizeContent(initialWidth * pinch.scale,
                                            initialHeight * pinch.scale,
                                            pinch.center)

        onPinchFinished: flick.returnToBounds()

        Image { width: flick.contentWidth; height: flick.contentHeight;
                source: "../images/rocket.svg" }
    }
}

