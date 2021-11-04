/*************************************************************************
 *
 * Copyright (c) 2011-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

/*Loader con archivo externo*/
Rectangle {
    width: 300
    height: 100
    //--> slide
    Loader {
        id: loader
        source: "LineEdit.qml"
        anchors { left: parent.left; right: parent.right; top: parent.top }
        // asynchronous: true // Para utilizarlo en modo asincrónico
    }
    //<-- slide
    Text {
        id: txt1
        text: "Binding: " + (loader.item ?  loader.item.text : "") // Preguna por el item por si no esta cargado aun
        anchors { left: parent.left; right: parent.right; top: loader.bottom; margins: 5 }
    }

    Text {
        id: txt2
        anchors { left: parent.left; right: parent.right; top: txt1.bottom; margins: 5 }
    }

    /*Acceder a los campos del item del loader declarativamente
    (solo para elementos cargados a través de archivos)*/
    Binding {
        target: loader.item
        property: "text"
        value: "Hello world"
    }
    //--> slide

    /*Accede a las señales del item cargado dinámicamente por el loader
    (solo para elementos cargados a traves de archivos)*/
    Connections {
        target: loader.item
        onReturnPressed: txt2.text = "Return Pressed: " + text
    }
    //<-- slide
}
