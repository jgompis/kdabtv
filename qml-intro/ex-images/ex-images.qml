/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

BorderImage {
    id: name
    source: "../images/rocket.svg"
    width: 200; height: 200
    /*Poner el borde de esta manera es lo mismo que
    hacer border.top, border.bottom, border.left
    border.right de manera separada*/
    border {top: 30; bottom: 30; left: 30; right:30}
    verticalTileMode: BorderImage.Stretch
    horizontalTileMode: BorderImage.Stretch

}

