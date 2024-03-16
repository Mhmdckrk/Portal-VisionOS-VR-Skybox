//
//  ImmersiveView.swift
//  VRSkyBox
//
//  Created by Mahmud CIKRIK on 27.02.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.openWindow) var openWindow2
    @EnvironmentObject var skyBoxSettings:SkyboxSettings
    
    var body: some View {
        RealityView { content in
            // Create a skybox
            openWindow(id: "SkyBoxControls")
            openWindow2(id: "SkyBoxControls2")

            guard let skyBoxEntity = createSkyBox() else { return }
            // Add content
            content.add(skyBoxEntity)
        } update: { content in
            //Print latest skyboxseting
            print("Latest skybox settings is: \(skyBoxSettings.currentSkybox)")
            
            
            //Update current skybox
            updateSkybox(with: skyBoxSettings.currentSkybox, content: content)
        }
    }
    
    private func createSkyBox () -> Entity? {
        // Mesh (large sphere)
        let skyBoxMesh = MeshResource.generateSphere(radius: 1000)
        
        // Material (skybox large)
        var skyBoxMaterial = UnlitMaterial()
        guard let skyBoxTexture = try? TextureResource.load(named: "Space") else { return nil }
        skyBoxMaterial.color = .init(texture: .init(skyBoxTexture))
        
        // Entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: skyBoxMesh,
                materials: [skyBoxMaterial]
            )
        )
        
        skyBoxEntity.name = "SkyBox"
              
        //Map image to inner surface of sphere
        skyBoxEntity.scale = .init(x: -1, y: 1, z: 1)
                                     
        return skyBoxEntity
        
        
    }
    private func updateSkybox (with newSkyBoxName:String, content: RealityViewContent) {
        // Get Skybox entity from material
        let skyBoxEntity = content.entities.first { entity in
            entity.name == "SkyBox"
        }
        
        
        // update its material to latets skybox
        guard let updatedSkyBoxTexture = try? TextureResource.load(named: newSkyBoxName) else { return }
        
        var updatedSkyBoxMaterial = UnlitMaterial()
        updatedSkyBoxMaterial.color = .init(texture: .init(updatedSkyBoxTexture))
        
        // Set to component
        skyBoxEntity?.components.set(ModelComponent(mesh: MeshResource.generateSphere(radius: 1000), materials: [updatedSkyBoxMaterial]))
        
    }
    
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
