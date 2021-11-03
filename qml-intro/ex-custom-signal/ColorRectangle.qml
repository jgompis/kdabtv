
import QtQuick 2.0

Item {
    property bool checked: false
    property alias text: text.text

    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: checked? "red" : "green"

        Text {
            id: text
            anchors.centerIn: parent
            anchors.margins: 5
            text: ""
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: checked = !checked
    }
}
