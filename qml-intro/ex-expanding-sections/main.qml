/*************************************************************************
 *
 * Copyright (c) 2013-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

import QtQuick 2.0

ListView {
    id: view

    /*Lista de elementos colapsados,
    que en realidad es un objectMap*/
    property var collapsed: ({})

    width: 150
    height: 250
    focus: true
    clip: true

    /*Lista de elementos*/
    model: NameModel { }

    /*Como se pinta cada item*/
    delegate: NameDelegate {
        readonly property ListView __lv: ListView.view

        anchors {
            left: parent.left
            leftMargin: 2

            right: parent.right
            rightMargin: 2
        }

        expanded: view.isSectionExpanded( model.team )

        MouseArea {
            anchors.fill: parent
            onClicked: __lv.currentIndex = index
        }
    }

    highlight: HighlightDelegate {
        width: parent.width
        anchors {
            left: parent.left
            right: parent.right
        }
    }

    section {
        property: "team"
        criteria: ViewSection.FullString

        delegate: SectionDelegate {
            anchors {
                left: parent.left
                right: parent.right
            }

            text: section

            /*Debería haber usado una readonly*/
            onClicked: view.toggleSection( section )
        }
    }

    function isSectionExpanded( section ) {
        // Se fija si no está el elemento en la lista
        return !(section in collapsed);
        //return !collapsed[section]
    }

    function showSection( section ) {
        // Borra la sección del mapa de colapsadas
        delete collapsed[section]
        //collapsed[section]= false
        /*emite la señal manualmente, ya que no es
        una variable comun sino que es un mapa*/
        collapsedChanged();
    }

    function hideSection( section ) {
        collapsed[section] = true
        /*emit*/ collapsedChanged();
    }

    function toggleSection( section ) {
        if ( isSectionExpanded( section ) ) {
            hideSection( section )
        } else {
            showSection( section )
        }
    }
}
