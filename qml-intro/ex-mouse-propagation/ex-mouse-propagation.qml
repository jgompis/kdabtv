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
    width: 400; height: 250;
    color: "lightblue"

    Rectangle {
        x: 50
        y: 50
        width: 100
        height: 100

        color: "red"

        MouseArea {
            anchors.fill: parent
            onPressed: console.log("Lower rectangle pressed.");
            onReleased: console.log("Lower rectangle released.");
            onClicked: console.log("Lower rectangle clicked.");
        }
    }

    Rectangle {
        x: 100
        y: 100
        width: 100
        height: 100

        /*Para poder ver la intesección*/
        opacity: 0.5
        color: "yellow"

        // Play around with the commented out lines to see how the behaviour changes
        MouseArea {
            anchors.fill: parent

            /*Como dice la documentación:
            MouseArea contains several composed events:
                clicked, doubleClicked and pressAndHold.
            These are composed of basic mouse events, like pressed,
            and can be propagated differently in comparison to basic events.

            Es decir que al no aceptar un evento básico, este se propaga de manera
            automática, pero al no aceptar un evento compuesto, para que el mismo
            se propague, es necesario contar con esta propiedad en true
            */
            //propagateComposedEvents: true

            onPressed: {
                /*Indica que no está interesado en el presionado
                del boton, por lo que no recibira la release*/
                //mouse.accepted = false;

                console.log("Upper rectangle pressed.");
            }
            onReleased: console.log("Upper rectangle released.");
            onClicked: {
                /*Si no acepta la release, el inferior no vera
                el presionado del boton, pero aún así le llegará
                la señal de clicked( ), considerando que se cuenta
                con la propiedad "propagateComposedEvents" en true*/
                //mouse.accepted = false;

                console.log("Upper rectangle clicked.");
            }
        }
    }
}
