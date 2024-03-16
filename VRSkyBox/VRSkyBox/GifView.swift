//
//  GifView.swift
//  VRSkyBox
//
//  Created by Mahmud CIKRIK on 14.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct GifView: View {
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        ZStack {
            Image("Empty").resizable()
            AnimatedImage(name: name)
        }
        
    }
    
}

#Preview {
    GifView(name: "ricky.gif").padding(10)
}
