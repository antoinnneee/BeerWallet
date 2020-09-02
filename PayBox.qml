import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

Item {
    width: 480
    height: 400

    Column {
        id: column
        anchors.fill: parent

        Label {
            id: label
            width: parent.width
            text: qsTr("Destinataire")
            horizontalAlignment: Text.AlignHCenter
        }

        TextField {
            id: destAddr
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            placeholderText: "adr"
        }

        TokenSelector {
            id: tokenSelector
            width: parent.width
        }

    }

}

/*##^##
Designer {
    D{i:1;anchors_height:400;anchors_width:200;anchors_x:140;anchors_y:15}
}
##^##*/
