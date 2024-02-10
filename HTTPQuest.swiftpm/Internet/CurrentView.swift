//
//  CurrentView.swift
//  
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct CurrentView: View {
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.purple
                
                VStack(alignment: .leading) {
                    Text("TODAY")
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
            
            TabView {
                
                ScrollView {
                    VStack {
                        CurrentPageOne()
                        
                        TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                }
                    .tabItem {
                        Label("Page 1", systemImage: "circle")
                    }
                    .tag(0)
                
                
                ScrollView {
                    VStack {
                        CurrentPageTwo()
                        
                        TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                }
                    .tabItem {
                        Label("Page 2", systemImage: "circle")
                    }
                    .tag(1)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .top)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    CurrentView()
}
