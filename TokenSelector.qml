import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtQuick3D 1.15
import QtQuick 2.15

import "qrc:/asset_imports/Quick3DAssets/Coin/"

Item {
    id: tokenSelector
    height: 200
    

    Row {
        id: row
        spacing: 5
        anchors.fill: parent
        
        Image {
            id: image
            width: parent.width/3 -5
            height: width
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
//            source: "qrc:/qtquickplugin/images/template_image.png"

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
