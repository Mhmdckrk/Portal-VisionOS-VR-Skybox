//
//  VRSkyBoxApp.swift
//  VRSkyBox
//
//  Created by Mahmud CIKRIK on 27.02.2024.
//

import SwiftUI

@main
struct VRSkyBoxApp: App {
    
    @State private var style: ImmersionStyle = .mixed
    @ObservedObject var skyBoxSettings = SkyboxSettings()
    @ObservedObject var skyBoxSettings2 = SkyboxSettings()
    
    var body: some Scene {
        
        WindowGroup(id: "SkyBoxControls") {
            SkyBoxControlView()
                .environmentObject(skyBoxSettings)
            
        }
        .windowStyle(.plain)
        .defaultSize(width: 850, height: 850)
        
        
        //VR
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(skyBoxSettings)
        }.immersionStyle(selection: $style, in: .full)
        
        
        
        
        
    }
}

class SkyboxSettings: ObservableObject {
    @Published var currentSkybox = ""
    
}
