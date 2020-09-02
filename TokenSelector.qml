import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtQuick 2.15


Item {
    id: tokenSelector
    height: 200
    Row {
        id: row
        spacing: 5
        anchors.fill: parent
        
        GraphicalToken {
            id: graphicalToken
            anchors.verticalCenter: parent.verticalCenter
        }
        
        SpinBox {
            id: spinToken
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Label {
            id: labelToken
            width: parent.width / 3 -5
            text: qsTr("Label")
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}



/*##^##
Designer {
    D{i:0;active3dScene:-1}
}
##^##*/
