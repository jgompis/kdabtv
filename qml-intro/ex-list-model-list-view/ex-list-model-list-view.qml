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
        Rectangle {
            /*Se le pone un id para que todos los subelementos
            puedan acceder a las attached properties*/
            //id: root

            /*También se puede hacer a traves de una propiedad personalizada,
            lo cual es más recomendable*/
            readonly property ListView __lv : ListView.view

            /*Tiene que darle el ancho y alto*/
            implicitHeight: txt.height

            anchors.left: parent.left
            anchors.right: parent.right
            clip: true
            /*Accediendo a traves de la attached property,
            se debe considerar que la attached property solo
            esta relacionada con el elemento base del delegate*/
            //color: ListView.view.currentIndex === index ? "gray" : "yellow"
            color: __lv.currentIndex === index ? "gray" : "yellow"


            Text {
                id: txt
                text: model.name;
                font.pixelSize: 32

                Component.onCompleted: console.log("Welcome", model.index, model.name)
                Component.onDestruction: console.log("Die", model.index, model.name)

            }


            MouseArea {
                anchors.fill: parent
                onClicked:
                    __lv.currentIndex= model.index
                    //root.ListView.view.currentIndex= model.index // se puede usar index solo
            }
        }

    }
    //--> slide
    /*Vista de la lista*/
    ListView {
        id: lv
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        clip: true
        Component.onCompleted: console.log(cacheBuffer) // arroja 320 por defecto
        /*currentIndex es el item actual*/
        onCurrentIndexChanged: console.log(currentIndex)
    }
    //<-- slide
}
