import QtQuick3D 1.12
import QtQuick 2.12

Node {
    id: node01Alocasia_obj_obj
    rotationOrder: Node.XYZr
    orientation: Node.RightHanded

    Model {
        id: leaf_010
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf_010.mesh"

        DefaultMaterial {
            id: wire_204204204_material
            diffuseColor: "#ffcccccc"
        }
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: pot
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/pot.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: moh
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/moh.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: dirt02
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/dirt02.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: stem
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/stem.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: lef04_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/lef04_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf05_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf05_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf02_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf02_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf006_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf006_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf03_000
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf03_000.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf007
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf007.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf_008
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf_008.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf_011
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf_011.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: leaf_009
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/leaf_009.mesh"
        materials: [
            wire_204204204_material
        ]
    }

    Model {
        id: dirt
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/dirt.mesh"
        materials: [
            wire_204204204_material
        ]
    }
}
