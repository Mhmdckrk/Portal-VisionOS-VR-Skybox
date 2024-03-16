//
//  SkyBoxControlView.swift
//  VRSkyBox
//
//  Created by Mahmud CIKRIK on 27.02.2024.
//

import SwiftUI
//import Lottie

struct SkyBoxControlView: View {
    
    @EnvironmentObject var skyBoxSettings:SkyboxSettings
    @State private var index = 0
    
    let array = ["Forest","Town","Space"]
    
    var body: some View {
        ZStack {
            SkyBoxButton(onClick: {
                //Change Skybox
                print(index)
                if index < 3 {
                    skyBoxSettings.currentSkybox = array[index]
                } else {
                    index = 0
                    skyBoxSettings.currentSkybox = array[index]
                }
                index += 1
            })
            Rectangle()
                .fill(Color.pink)
                .cornerRadius(1000)
                .frame(width: 500, height: 500)
                .frame(depth: -5.0)
            
        }
        .frame(width: 800, height: 800)
        .background(Color.black)
            
    }
}

#Preview {
    SkyBoxControlView()
}

struct SkyBoxButton: View {
    
    var onClick: () -> Void
//    var iconName: String
    
    var body: some View {
        Button(action: {
            // Change skybox
            onClick()
            
        }, label: {
//            Circle().fill(Color.red)
            GifView(name: "ricky.gif").padding([.bottom, .trailing], 40.0)
        })
        .background(Color.clear)
            .buttonStyle(PlainButtonStyle())
        .frame(width: 720,height: 720, alignment: .center)
        .hoverEffectDisabled()
    }
}
