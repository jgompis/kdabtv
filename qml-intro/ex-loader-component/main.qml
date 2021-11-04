/*************************************************************************
 *
 * Copyright (c) 2011-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Rectangle {
    width: 300
    height: 100
    //--> slide
    property int foo: 10
    Component {
        id: lineEditComponent

        LineEdit {
            text: "Hello World" + foo
            onReturnPressed: txt2.text = "Return Pressed: " + text // Se puede realizar acá directamente
        }
    }

    Loader {
        /*Esta es la propiedad que vera el Component
        ya que será un hijo de Loader*/
        property int foo: 10
        id: loader
        sourceComponent: lineEditComponent
        anchors { left: parent.left; right: parent.right; top: parent.top }
    }
    //<-- slide

    Text {
        id: txt1
        text: "Binding: " + (loader.item ?  loader.item.text : "")
        anchors { left: parent.left; right: parent.right; top: loader.bottom; margins: 5 }
    }

    Text {
        id: txt2
        anchors { left: parent.left; right: parent.right; top: txt1.bottom; margins: 5 }
    }
}
