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
    width: 400; height: 400; color: "#00a3fc"
    focus: true

    Image {
        id: rocket
        anchors.centerIn: parent
        source: "../images/rocket.svg"

        transform: Rotation{
            origin.x: 0
            origin.y: 25
            angle: 45;
        }

        // Funcion para hacer una prueba
        function rotatefn(angle){
            transform[0].angle= (transform[0].angle + angle) % 360
        }
    }

    /*Dentro del elemento Keys se encuentran muchos de los botones
    del teclado*/
    Keys.onLeftPressed:
        rocket.rotatefn(-10)
        //rocket.rotation = (rocket.rotation - 10) % 360
    Keys.onRightPressed:
        rocket.rotatefn(10)
        //rocket.rotation = (rocket.rotation + 10) % 360
    /*Para cualquier boton, excepto para los que ya tengan
    asignado el handler*/
    Keys.onPressed:
        // Detección de la tecla enter
        console.log(event.key === Qt.Key_Return)
}
