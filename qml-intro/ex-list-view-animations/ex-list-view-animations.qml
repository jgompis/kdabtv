/*************************************************************************
 *
 * Copyright (c) 2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    width: 150; height: 200; color: "white"

    ListModel {
        id: nameModel
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
    }

    Component {
        id: nameDelegate
        Text {
            text: model.name;
            font.pixelSize: 32
            MouseArea {
                anchors.fill: parent
                onClicked: nameModel.insert(index, {name: "Item #"+nameModel.count})
            }
        }
    }
    //--> slide
    ListView {
        //--> hide
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        clip: true //<-- hide

        /*Animación que indica como se llena la ListView*/
        populate: Transition {
            NumberAnimation { properties: "x,y"; duration: 300 }
        }

        /*Animación que indica que sucede cuando se agrega un elemento a la lista*/
        add: Transition {
            /*Básicamente esta property action indica que se quiere cambiar
            la transformada de origen tan pronto como se haya creado el nuevo item.
            Por lo que no es una animación, si no que es algo que sucede de manera
            instantánea*/
            PropertyAction { property: "transformOrigin"; value: Item.TopLeft }
            /*Anima la opacidad*/
            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200}
            /*Anima la escala*/
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
        }

        /*Animación que sucede cuando un elemento es desplazado por acción de haber
        agregado otro nuevo*/
        displaced: Transition {
            /*IMPORTANTE!: Evita que queden items pequeños al agregar nuevos rápidamente, ya
            que la animacion de opacidad  y de escala en la propiedad add
            no se llegan a ejecutar completamente si se agrega otro elemento.
            Esto lo que hace es agrandar los elementos de golpe en caso de
            presionar el mouse mas rápido que 200ms (FUNCIONA COMO UN RESET)*/
            PropertyAction { properties: "opacity, scale"; value: 1 }
            /*Esta es la que sucede normalmente*/
            NumberAnimation { properties: "x,y"; duration: 200 }
        }
    }
    //<-- slide
}
