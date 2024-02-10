//
//  ConclusionView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct ConclusionView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.yellow
                
                VStack(alignment: .leading) {
                    Text("RECAP")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                    
                    Text("Let's recap!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    Spacer()
                }.padding(20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            
            
            ScrollView {
                VStack {
                    ConclusionContentView()
                    
                    TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ConclusionView(tabSelection: .constant(3))
}
