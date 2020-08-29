import QtQuick 2.0
import Wallet 1.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

Item {

    property Wallet wallet
    width: 480
    height: 250

    ColumnLayout {
        id: columnLayout
        spacing: 2
        anchors.fill: parent

        TextArea {
            id: address
            width: 250
            height: 26
            text: qsTr("Address : ") + wallet.address
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere

            selectByMouse: true
        }

        Label {
            id: service
            width: 250
            height: 26
            text: "service : " + wallet.serviceToken + " ST"
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere
        }


        Label {
            id: mojito
            width: 250
            height: 26
            text: "mojito : " + wallet.mojitoToken + " MT"
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere
        }


        Label {
            id: beer
            width: 250
            height: 26
            text: "Beer : " + wallet.beerToken + " BT"
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere
        }




    }

}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}
}
##^##*/
