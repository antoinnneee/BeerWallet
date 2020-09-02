import QtQuick 2.12
import QtQuick.Controls 2.12
import Wallet 1.0
import QtQuick 2.15

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
        enabled: wal.connectionState == Wallet.Connected
        text: qsTr("synchro")
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: cpp.getWallet(wal)
    }

    Button {
        id: buttonLogin
        x: 254
        text: qsTr("login")
        anchors.top: buttonSync.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: wal.connectionState == Wallet.NotConnected
        onClicked: {inputDial.funcState = 0 ;inputDial.open(); inputDial.textInput.focus = true}
    }
    Button {
        id: buttonGenerate
        x: 254
        text: qsTr("Generate Address")
        anchors.top: buttonLogin.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: wal.connectionState == Wallet.NotConnected
        onClicked: {inputDial.funcState = 1 ;inputDial.open(); inputDial.textInput.focus = true}
    }




    LoginDialog {
        id: inputDial
        property int funcState: 0
        width: parent.width
        height: parent.height/2
        y: (parent.height - height)/2
        onAccepted: (funcState == 0) ? cpp.checkConnection(textInput.text, passwordInput.text) : cpp.generateWallet(textInput.text, passwordInput.text);
    }



    TextField {
        id: textField
        x: 325
        y: 720
        width: 155
        height: 40
        text: "1"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        placeholderText: qsTr("1")
    }

    TextField {
        id: textField1
        x: 164
        y: 720
        width: 155
        height: 40
        text: "1"
        anchors.right: textField.left
        anchors.bottom: parent.bottom
        anchors.rightMargin: 6
        anchors.bottomMargin: 0
        placeholderText: qsTr("1")
    }

    //    TokenSelector {
    //        id: tokenSelector
//        x: 0
//        y: 541
//        width: 480
//        height: 219
//    }


}

/*##^##
Designer {
    D{i:0;active3dScene:"-1"}
}
##^##*/
