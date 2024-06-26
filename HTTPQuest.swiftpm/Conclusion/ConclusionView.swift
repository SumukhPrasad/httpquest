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
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.clockwise")
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
                    Text("RECAP")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    
                    Text("Let's recap!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                }.padding(20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    ConclusionContentView()
                }
                .padding(20)
                .frame(maxWidth: .infinity)
            }
            
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ConclusionView(tabSelection: .constant(3))
}
