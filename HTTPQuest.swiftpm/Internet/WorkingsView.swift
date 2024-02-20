//
//  WorkingsView.swift
//  
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct WorkingsView: View {
    @State private var currentPage = 0
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.teal
                
                VStack(alignment: .leading) {
                    Text("HOW THE INTERNET WORKS • PAGE \(currentPage+1)")
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
            
            TabView(selection: $currentPage) {
                
                ScrollView {
                    VStack {
                        WorkingsPageOne()
                        
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
                        WorkingsPageTwo()
                        
                        TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                }
                    .tabItem {
                        Label("Page 2", systemImage: "circle")
                    }
                    .tag(1)
                
                ScrollView {
                    VStack {
                        WorkingsPageThree()
                        
                        TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                }
                    .tabItem {
                        Label("Page 3", systemImage: "circle")
                    }
                    .tag(2)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .top)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    WorkingsView()
}
