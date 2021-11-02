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
    width: 680
    height: 240

    /*focusBox*/
    Rectangle {
        id: focusBox
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }
        width:200; height:200
        /*Property binding (declarativo)*/
        color: focusArea.containsMouse? "green": "cyan"
        Text {
            anchors.centerIn: parent
            text: "Observe my color"
        }
    }

    /*NN*/
    Rectangle {
        anchors.centerIn: parent
        width: 200; height:200
        color: "yellow"
        MouseArea {
            id: focusArea
            anchors.fill:  parent
            hoverEnabled: true
        }
        Text {
            anchors.centerIn: parent
            text: "Move\ninto me"
        }
    }

    /*NN*/
    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 20
        }
        width:200; height:200
        color: "black"

        MouseArea {
            id: clickArea
            anchors.fill:  parent

            /*signal handler (imperativo),
            al ejecutar la imperativa que dice que
            focusBox.color= "blue" se pierde la propertyBinding
            que se encontraba almacenada anteriormente en la propiedad
            color de focusBox*/
            onClicked: ()=>{
               focusBox.color= "blue"
            }
        }
        Text {
            color: "white"
            anchors.centerIn: parent
            text: "Click\nme"
        }
    }
}

/*NOTA IMPORTANTE: cuando se asigna una propiedad, el binding
se remueve*/

/*NOTA IMPORTANTE 2: la utilización del táctil con el dedo
o lo que fuere funciona de la misma manera que el mouse, por lo
menos en lo que respecta a clicks y lo visto en esta unidad*/
