import QtQuick 2.0
import QtQuick.Controls 2.15

Dialog {
    id: dialog
    focus: true
    property alias textInput: textInput
    title:"Addresse"
    standardButtons: Dialog.Ok | Dialog.Cancel
    TextField {
        id:textInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        height: 50
        selectByMouse: true
        focus: true
        onFocusChanged: console.log("Focus changed " + focus)
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
