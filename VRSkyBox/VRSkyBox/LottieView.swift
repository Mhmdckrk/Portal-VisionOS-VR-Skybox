//
//  LottieView.swift
//  VRSkyBox
//
//  Created by Mahmud CIKRIK on 14.03.2024.
//

import SwiftUI
import Lottie

struct ContentsView: View {
    var body: some View {
        VStack {
                    LottieView(animationFileName: "portalPurple", loopMode: .loop)
                        .frame(width: 30, height: 30)
                }
    }
}

#Preview {
    ContentsView()
}

struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
                animationView.loopMode = loopMode
                animationView.play()
                animationView.contentMode = .scaleAspectFill
                return animationView
    }
    
}
