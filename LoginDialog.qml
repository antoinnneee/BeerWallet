import QtQuick 2.0
import QtQuick.Controls 2.15

Dialog {
    id: dialog
    focus: true
    property alias textInput: textInput
    property alias passwordInput: passwordInput
    title:"Addresse"
    standardButtons: Dialog.Ok | Dialog.Cancel
    TextField {
        id:textInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        height: 50
        anchors.verticalCenterOffset: -height
        selectByMouse: true
        focus: true
        onFocusChanged: console.log("Focus changed " + focus)
    }
    TextField {
        id:passwordInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        height: 50
        anchors.verticalCenterOffset: height
        selectByMouse: true
        focus: true
        onFocusChanged: console.log("Focus changed " + focus)
        echoMode: TextInput.Password
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
