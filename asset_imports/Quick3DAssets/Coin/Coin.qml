import QtQuick3D 1.15
import QtQuick 2.15

Node {
    id: coin_obj

    Model {
        id: cylinder
        source: "meshes/cylinder.mesh"

        DefaultMaterial {
            id: coin_texture_material
            diffuseColor: "#ff999999"
        }
        materials: [
            coin_texture_material,
            coin_texture_material
        ]
    }
}
