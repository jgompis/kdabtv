/*************************************************************************
 *
 * Copyright (c) 2010-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.12

Rectangle {
    width: 400; height: 100
    color: "lightblue"

    /*Elemento Custom en LineEdit.qml*/
    LineEdit {
        id: linedit
        anchors.centerIn: parent
        width: 300; height: 50
    }

    MouseArea {
        anchors.fill: parent

        onClicked: console.log(linedit.text)
    }
}
