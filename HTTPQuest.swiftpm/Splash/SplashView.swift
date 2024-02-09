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
                
                Text("The internet works in truly mysterious and magical ways. Let's see how that happens.").fontWeight(.bold).opacity(0.5)
                
                TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
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
            
            
            VStack {
                Text("Next Step: Learning")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Ready to learn about how th internet works from the inside out?").fontWeight(.bold)
                    .multilineTextAlignment(.leading).opacity(0.5)
                
                Button(action: {tabSelection=1}, label: {
                    HStack {
                        Text("Learn")
                        Image(systemName: "chevron.right")
                    }
                }).buttonStyle(.borderedProminent)
                
            }
                .tabItem {
                    Label("Next Steps", systemImage: "circle")
                }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear() {
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.secondaryLabel
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.tertiaryLabel
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    SplashView(tabSelection: .constant(0))
}
