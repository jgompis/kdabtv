/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

Image {
    id: image
    width: 800; height: 800
    source: "https://eoimages.gsfc.nasa.gov/images/imagerecords/74000/74393/world.topo.200407.3x5400x2700.jpg"
    fillMode: Image.PreserveAspectFit


    Rectangle {
        color: "blue"
        x: 0; y: 750
        height: 50
        width: image.width * image.progress
        visible: image.progress != 1
    }

    onStatusChanged: console.log(sourceSize)
}

