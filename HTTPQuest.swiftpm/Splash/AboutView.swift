//
//  AboutView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        HStack {
            
            ZStack(alignment: .leading) {
                Color.red
                
                VStack(alignment: .leading) {
                    Text("About this project")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                    
                    Text("Hey there!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    Spacer()
                }.padding(20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            
            VStack(alignment: .leading) {
                AboutContentView()
                
                TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity)
                        
        }.ignoresSafeArea()
    }
}

#Preview {
    AboutView()
}
