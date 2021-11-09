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
    width: 150; height: 200; color: "white"

    /*Lista de elementos con propiedades
    personalizadas*/
    ListModel {
        id: nameModel
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
        ListElement { name: "Alice" }
        ListElement { name: "Bob" }
        ListElement { name: "Jane" }
        ListElement { name: "Victor" }
        ListElement { name: "Wendy" }
    }

    /*El delegado se usa para cada componente de la lista*/
    Component {
        id: nameDelegate
        Text {
            text: model.name;
            font.pixelSize: 32


            Component.onCompleted:{
                console.log("Welcome", model.index, model.name)
            }
            Component.onDestruction:{
                console.log("Die", model.index, model.name)
            }
        }
    }
    //--> slide
    /*Vista de la lista*/
    ListView {
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        /*Es necesario para que no dibueje los elementos
        de la lista fuera al hacer scroll*/
        clip: true
        /*Permite controlar cuantos pixeles se quieren
        en la caché. La cache se llama cacheBuffer
        y se puede controlar desde el elemento ListView e
        indica cuantas lineas de pixeles se cachean arriba
        y abajo de la lista*/
        cacheBuffer: 40
        //Component.onCompleted: console.log(cacheBuffer) // arroja 320 por defecto
    }
    //<-- slide
}
