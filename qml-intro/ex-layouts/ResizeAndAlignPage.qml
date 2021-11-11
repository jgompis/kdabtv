/*************************************************************************
 *
 * Copyright (c) 2017-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {
    width: 400
    height: 300
    //--> slide
    /*Elemento columna*/
    ColumnLayout {
        /*Se siguen usando anchors para definir
        el tamaño del ColumnLayout*/
        anchors.fill: parent
        anchors.margins: 5 // Márgen

        /*Elemento fila, para la palabra "filename"
        y el input de texto*/
        RowLayout {
            /*Hace referencia al ColumnLayout del nivel superior,
            en este caso se esta alineando con la parte superior del mismo*/
            Layout.alignment: Qt.AlignTop

            /*Elementos con tamaño implícito*/
            Label {
                text: "Filename"
            }

            TextField {
                /*Llena el resto del espacio disponible*/
                // stretch to cover the rest of the row layout
                Layout.fillWidth: true
            }
        }

        /*Elemento fila, para los botones de la parte
        inferior derecha*/
        RowLayout {
            /*Quiere decir que va alineado en ambas partes*/
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight

            Button {
                text: "Ok"
            }
            Button {
                text: "Cancel"
            }
        }
    }
    //<-- slide
}
