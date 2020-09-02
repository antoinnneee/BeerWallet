import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11

RawGraphicalToken {
    width: 200
    height: 200
    view3DScale: 1
    Layout.fillWidth: false
    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
    animTo: 375
    animFrom: tokenRotationY%360
    animDuration: 1000
    elementPile: "/coin/mtCoin_I.png"
    elementFace: "/coin/mtCoin.png"
}
