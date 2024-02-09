//
//  TextAndIconView.swift
//  
//
//  Created by Sumukh Prasad on 09/02/24.
//

import SwiftUI

enum ImagePosition {
    case left
    case right
}


struct TextAndIconView: View {
    var text: String
    var systemImage: String
    var imagePosition: ImagePosition

    // add all parameters in the init
    init(text: String, systemImage: String, imagePosition: ImagePosition) {
        self.text = text
        self.systemImage = systemImage
        self.imagePosition = imagePosition
    }
    
    var body: some View {
        HStack {
            if imagePosition == .left {
                Image(systemName: systemImage).foregroundStyle(Color.accentColor)
            }
            
            Text(text).foregroundStyle(Color.accentColor)
            
            if imagePosition == .right {
                Image(systemName: systemImage).foregroundStyle(Color.accentColor)
            }
        }
    }
}

#Preview {
    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
}
