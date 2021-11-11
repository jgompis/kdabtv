/*************************************************************************
 *
 * Copyright (c) 2017-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.2 // Botton, lineEdit etc
import QtQuick.Layouts 1.1

Item {
    width: 600
    height: 400
    //--> slide
    GridLayout {
        /*Nuevamente se ancla al elemento padre */
        anchors.fill: parent
        anchors.margins: 5

        columns: 3 // Tiene 3 columnas

        /*No es necesario especificar la posición, simplemente se agrega el elemento a la grilla
        y se va posicionando dependiendo del flow. La propiedad fillWidth se refiere en este
        caso al ancho de la columna*/
        // auto positioning based on flow: forth button overflows into second row//--> hide
        Button {
            Layout.fillWidth: true

            text: "One"
        }
        Button {
            Layout.fillWidth: true

            text: "Two"
        }

        Button {
            Layout.fillWidth: true

            text: "Three"
        }
        Button {
            Layout.fillWidth: true

            text: "Four"
        }


        /*Se pueden posicionar elementos en posiciones específicas
        Si no se requiere ponerlos de manera automática */
        // specific placement
        Button {
            Layout.row: 1
            Layout.column: 2
            Layout.fillWidth: true

            text: "Five"
        }

        // overflow into next row still works
        Label {
            text: "File"
        }

        // spanning two columns, same row
        TextField {
            /*Se estira dos columnas*/
            Layout.columnSpan: 2
            /*Llena el ancho de dos columnas*/
            Layout.fillWidth: true

            placeholderText: "Enter filename"
        }//<-- hide

        Label {
            text: "Comment"
        }

        /*Lugar para escribir*/
        TextArea {
            Layout.columnSpan: 2 // Se estira dos columnas
            Layout.rowSpan: 4 // Se estira 4 filas
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button  {
            Layout.row: 6
            Layout.column: 0

            text: "Send"
        }
    }
    //<-- slide
}
