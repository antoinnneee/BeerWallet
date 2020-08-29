import QtQuick 2.12
import QtQuick.Controls 2.12
import Wallet 1.0

Item {
    id: element
    visible: true
    width: 480
    height: 760

    Wallet {
        id:wal
        Component.onCompleted: {
            cpp.handleWallet(this)
        }
    }
    WalletView{
        anchors.bottom: buttonSync.top
        anchors.bottomMargin: 2
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        wallet: wal

    }

    Button {
        id: buttonSync
        x: 252
        y: 231
        enabled: wal.address
        text: qsTr("synchro")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: cpp.getWallet(wal.address)
    }

    Button {
        id: buttonLogin
        x: 254
        text: qsTr("login")
        anchors.top: buttonSync.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: !wal.address
        onClicked: {inputDial.funcState = 0 ;inputDial.open(); inputDial.textInput.focus = true}
    }
    Button {
        id: buttonGenerate
        x: 254
        text: qsTr("Generate Address")
        anchors.top: buttonLogin.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: !wal.address
        onClicked: {inputDial.funcState = 1 ;inputDial.open(); inputDial.textInput.focus = true}
    }
    InputTextDialog {
        id: inputDial
        property int funcState: 0
        width: parent.width
        y: parent.height/2
        onAccepted: (funcState == 0) ? cpp.loginWallet(textInput.text) : cpp.generateWallet(textInput.text);
    }
}

/*##^##
Designer {
    D{i:2;anchors_height:211;anchors_width:480}D{i:4;anchors_y:238}
}
##^##*/
