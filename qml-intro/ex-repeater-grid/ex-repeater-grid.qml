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
    width: 400; height: 400; color: "black"

    Grid {
        x: 5; y: 5
        rows: 5; columns: 5; spacing: 10

        /*Component {
            id: customRectangle

            Rectangle {
                width: 70; height: 70
                color: "red"
            }

        }*/


        /*El repeater crea tantos elementos
        como se indique en la propiedad
        model*/
        Repeater {
            /*Se ejecuta 24 veces, creando
            exactamente 24 rectangulos de,
            en este caso 70x70*/
            model: 25
            /*delegate: Rectangle {
                 width: 70; height: 70
                 color: "lightgreen"
            }*/
            delegate: CustomRectangle {} // Utilizando componente personalizado
        }
    }
}
