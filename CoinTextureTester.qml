import QtQuick 2.0
import QtQuick.Controls 2.15

GraphicalToken{
    id:token
    width: 600
    height: 600
    tokenRotationX: sliderX.value
    tokenRotationY: sliderY.value
    tokenRotationZ: 0
    animDuration: sliderZ.value
    view3DScale: 1
    elementFace:  "file:./coin_I.png"
    elementPile:  "file:./coin.png"
    normalFace:  "file:./normal_I.png"
    normalPile:  "file:./normal.png"
    specularFace:  "file:./specular_I.png"
    specularPile:  "file:./specular.png"
    normalMapEnable: normalBox.checked
//    specularMapEnable: specularBox.checked
//    elementSource: "coin/coinTextureV3.png"

    Slider {
        id: sliderX
        y: 352
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        stepSize: 5
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.bottomMargin: 8
        value: 270
        to: 630
        from: -270
    }


    Slider {
        id: sliderZ
        x: 352
        width: 40
        anchors.right: parent.right
        anchors.top: sliderY.bottom
        anchors.bottom: sliderX.top
        anchors.bottomMargin: 6
        anchors.topMargin: 6
        anchors.rightMargin: 8
        orientation: Qt.Vertical
        value: 4000
        stepSize: 100
        to: 8000
        from: 100
    }


    Slider {
        id: sliderY
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        value: 0
        stepSize: 5
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        to: 630
        from: -270
    }


    Rectangle {
        id: rectangle
        color: "#d3d7d7"
        anchors.fill: parent
        z: -2
    }

    CheckBox {
        id: normalBox
        text: qsTr("normalMap")
        anchors.left: parent.left
        anchors.top: sliderY.bottom
        anchors.leftMargin: 8
        anchors.topMargin: 6
    }

    Button {
        id: button
        text: qsTr("reload")
        anchors.left: parent.left
        anchors.top: normalBox.bottom
        anchors.leftMargin: 8
        anchors.topMargin: 6
        onClicked: cpp.reloadGraph()
    }
}

/*##^##
Designer {
    D{i:6}
}
##^##*/
