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
                
                Text("To most of us, the Internet is a virtual thing — we use it to talk with friends, to know more about the world, to share stories, to find inspiration: it has brought the world together in a way nothing before it could have. At an instant's notice, we have access to all the world's information. But have we taken the time to learn how this indispensable tool works?")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 50)
                
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
                
                Text("Ready to learn about how the Internet works from the inside out?").fontWeight(.bold)
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
