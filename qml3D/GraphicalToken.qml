import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtQuick3D 1.15
import QtQuick 2.15
import QtQuick3D.Materials 1.15

Item {
    id: graphicalToken
    width: parent.width/3 -5
    height: width
    property alias directionalLight: directionalLight
    property alias view3DScale: view3D.scale
    property alias elementSource: elementTexture.source
    property alias normalSource: normalTexture.source
    property alias specularSource: specularTexture.source
    property string elementFace: "coin/coinTextureV3.png"
    property string elementPile: "coin/coinTextureV3.png"
    property string normalFace: "coin/coinTextureV3.png"
    property string normalPile: "coin/coinTextureV3.png"
    property string specularFace: "coin/coinTextureV3.png"
    property string specularPile: "coin/coinTextureV3.png"

    property int tokenRotationX: -4
    property int tokenRotationY: 0
    property int tokenRotationZ: 90

    property bool normalMapEnable: true
    property bool specularMapEnable: false
    property int animDuration: 4000
    property int animTo: 4000
    property int animFrom: 4000

    onTokenRotationYChanged:{
//        console.log('Y :' + tokenRotationY)
    }

    onTokenRotationZChanged:{
//        console.log('Z :' + tokenRotationZ)
    }

    NumberAnimation on tokenRotationY{
        id: tokenAnim
        from: animFrom
        to:animTo
        duration: animDuration
        running: false
        onRunningChanged: {console.log(running)}
    }
    View3D {
        id: view3D
        anchors.fill: parent
        SceneEnvironment {
            id: sceneEnvironment
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
        }
        
        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: 0
                y: 128.703
                scope: cylinder
                brightness: 100
                eulerRotation.z: -0
                eulerRotation.y: 0
                eulerRotation.x: -42.33493
                z:153.09567
            }
            
            PerspectiveCamera {
                id: camera
                x: -0
                y: -0.864
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                z: 105.57977
            }

            Model {
                id: cylinder
                source: "#Cylinder"
                receivesShadows: false
                innerTessellation: 2
                edgeTessellation: 2
                tessellationMode: Model.Phong
                castsShadows: true
                isWireframeMode: false

                eulerRotation.z: tokenRotationZ
                eulerRotation.y: tokenRotationY
                eulerRotation.x: tokenRotationX

                onEulerRotationChanged: {
                    var x = tokenRotationX
                    var y = tokenRotationY
                    var conv = (y-x + (x - 90))
                    var z = tokenRotationZ
                    while (conv > 180)
                    {
                        conv -= 360
                    }
                    while (conv < -180)
                    {
                        conv += 360
                    }

                    if (conv >0)
                    {
                        elementSource = elementFace
                        normalSource = normalFace
//                        specularSource = specularFace
                    }
                    else
                    {
                        elementSource = elementPile
                        normalSource = normalPile
//                        specularSource = specularPile
                    }
                    console.log(' x:' + x + ' y:' + y +
                                ' y-x:' + conv)
                }

                scale.z: 1
                scale.y: 0.05743
                scale.x: 1
                DefaultMaterial {
                    id: material
//                    roughnessMap: specularTexture
//                    specularAmount: 0.5
                    lighting: DefaultMaterial.FragmentLighting
                    blendMode: DefaultMaterial.SourceOver
                    vertexColorsEnabled: false
                    bumpAmount: 1

                    diffuseMap: elementTexture
                    emissiveColor: "#ffffff"
                    diffuseColor: "#f9f9f9"
                    emissiveFactor: 0.2
                    emissiveMap: elementTexture
                    normalMap: (normalMapEnable) ? normalTexture : rawTexture
                    specularMap: (specularMapEnable) ? specularTexture : rawTexture

                    Texture {
                        id: elementTexture
                        source: elementPile
                        tilingModeVertical: Texture.ClampToEdge
                        tilingModeHorizontal: Texture.ClampToEdge
                        positionU: 0.015
                        positionV: -0.965
                        scaleU: 1.95

                        scaleV: 1.95

                    }
                    Texture {
                        id: rawTexture
                        tilingModeVertical: Texture.ClampToEdge
                        tilingModeHorizontal: Texture.ClampToEdge
                        positionU: 0.015
                        positionV: -0.965
                        scaleU: 1.95

                        scaleV: 1.95

                    }
                    Texture {
                        id: normalTexture
                        source: normalPile
                        tilingModeVertical: Texture.ClampToEdge
                        tilingModeHorizontal: Texture.ClampToEdge
                        positionU: 0.015
                        positionV: -0.965
                        scaleU: 1.95

                        scaleV: 1.95

                    }
                    Texture {
                        id: specularTexture
                        source: specularPile
                        tilingModeVertical: Texture.ClampToEdge
                        tilingModeHorizontal: Texture.ClampToEdge
                        positionU: 0.015
                        positionV: -0.965
                        scaleU: 1.95

                        scaleV: 1.95

                    }
                }
                materials: material
            }
        }
        environment: sceneEnvironment
    }
    
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked : { console.log("startAnimation");tokenAnim.start() }
    }
    
    //            fillMode: Image.PreserveAspectFit
    //            source: "qrc:/qtquickplugin/images/template_image.png"
    
}

/*##^##
Designer {
    D{i:0;active3dScene:3;formeditorZoom:4}
}
##^##*/
