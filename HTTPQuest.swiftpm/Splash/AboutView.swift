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
                Color.yellow
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "hand.wave.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            .foregroundColor(Color.white)
                            .opacity(0.5)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("INTRODUCTION")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    
                    Text("Hey there!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                }.padding(20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    AboutContentView()
                    
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                    Spacer()
                }
                .padding(20)
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity)
            }
                        
        }.ignoresSafeArea()
    }
}

#Preview {
    AboutView()
}
