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
    color: "lightblue"

    Rectangle {
        y: 150; width: 100; height: 100
        color: "green"

        /*La propiedad no se queda restringida a un único tipo
        de animación*/
        NumberAnimation on x {
            from: 0; to: 150; duration: 1000
            easing.type: Easing.OutExpo // Varía la posición de manera suave
        }
    }
}
