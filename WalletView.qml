import QtQuick 2.0
import Wallet 1.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import "qml3D"


Item {

    property Wallet wallet
    width: 480
    height: 250

    Column {
        id: columnLayout
        spacing: 2
        anchors.fill: parent

        TextArea {
            id: address
            height: 26
            text: qsTr("Address : ") + wallet.address
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            selectByMouse: true
        }


        Label {
            id: service
            height: parent.height/4
            text: "service : " + wallet.serviceToken + " ST"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: address.bottom
            font.pointSize: 11
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WrapAnywhere
            anchors.topMargin: 2
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            Layout.fillHeight: true
        }

        Row{
            id: rowMojito
            height: parent.height/4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: service.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            MtCoin {
                height: 50
                width: height
                anchors.left: parent.horizontalCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                tokenRotationY: -5
                anchors.leftMargin: 2
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
            Label {
                id: mojito
                text: wallet.mojitoToken
                anchors.left: parent.left
                font.pointSize: 11
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WrapAnywhere
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 2
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.right: parent.horizontalCenter
            }

        }
        Row{
            id: row
            height: parent.height/4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rowMojito.bottom
            anchors.topMargin: 2
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            MtCoin {

                width: height
                anchors.right: beer.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
            Label {
                id: beer
                width: 250
                height: 26
                text: wallet.beerToken + " BT"
                anchors.left: parent.horizontalCenter
                font.pointSize: 11
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WrapAnywhere
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }

        }


    }

}



/*##^##
Designer {
    D{i:2}D{i:3}D{i:6}
}
##^##*/
