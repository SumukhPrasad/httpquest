//
//  SplashView.swift
//  HTTPQuest
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct SplashView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        
        TabView {
            VStack {
                Text("Welcome to HTTPQuest!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("The internet works in truly mysterious and magical ways. Let's see how that happens.").fontWeight(.bold)
                    .multilineTextAlignment(.leading).opacity(0.5)
                
            }
                .tabItem {
                    Label("Welcome!", systemImage: "circle")
                }
                .tag(0)
            
            
            AboutView()
                .tabItem {
                    Label("About this Project", systemImage: "circle")
                }
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle())

        
    }
}

#Preview {
    SplashView(tabSelection: .constant(0))
}
