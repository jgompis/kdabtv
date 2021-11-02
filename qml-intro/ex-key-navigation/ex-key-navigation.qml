/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

//--> slide
import QtQuick 2.0

Rectangle {
    width: 400; height: 200; color: "black"

    Rectangle {
        id: leftRect
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 25
        }
        width: 150; height: 150
        color: activeFocus ? "red" : "darkred"

        /*KeyNavigation es como una clase con métodos
        estaticos como en este caso right, al cual se le
        enlaza el elemento rightRect para que se haga foco
        sobre el mismo al presionar la flecha derecha*/
        KeyNavigation.right: rightRect
        focus: true
    }

    Rectangle {//--> collapse
        id: rightRect
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 25
        }
        width: 150; height: 150
        color: activeFocus ? "#00ff00" : "#008800"
        KeyNavigation.left: leftRect
    }//<-- collapse
}
//<-- slide
