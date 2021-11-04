/*************************************************************************
 *
 * Copyright (c) 2010-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

//--> setup
Rectangle {
    id: root
    width: 150; height: 360
    color: "black"

    /*Sin el uso de state el codigo se hace
    inentendible*/
    Rectangle {
        id: redLight
        x: 25; y: 15; width: 100; height: 100
        radius: 50
        color: root.state == "stopState" ||
               root.state == "waitState"? "Red" : "lightGray"
    }
    Rectangle {
        id: yellowLight
        x: 25; y: 130; width: 100; height: 100
        radius: root.state == "waitState" ||
                root.state == "slowState"? 25 : 50
        color: root.state == "waitState" ||
               root.state == "slowState"? "Yellow" : "lightGray"
    }
    Rectangle {
        id: greenLight
        x: 25; y: 245; width: 100; height: 100
        radius: 50
        color: root.state == "driveState"? "Green" : "lightGray"
    }

    //<-- states
    state: "stopState"

    /*Timer para cambiar entre estados*/
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            var states = ["stopState", "waitState", "driveState", "slowState"]
            var nextIndex = ( states.indexOf(parent.state) + 1 ) % states.length
            parent.state = states[nextIndex]
        }
    }
}
