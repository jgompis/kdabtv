/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

/*Nuevo elemento desbloqueado!*/
Flickable {
    id: flick
    width: 400; height: 400

    /*Propiedades del content item, no del FlicflickableChildren:  */
    contentWidth: 1000
    contentHeight: 1000

    /*Contenido del flickable*/
    Image {
        /*Copia las propiedades del contenido, ya que
        en realidad la imagen es más pequeña que
        la ventana del Flickable

        Se debe tener en cuenta que el gran elemento por el
        cual se esta mirando a través de una ventana dada
        por Flickable, es el content item, el cual es el padre
        del elemento Flickable

        */
        width: parent.parent.contentWidth
        height: parent.parent.contentHeight
        source: "../images/rocket.svg"
    }
}
