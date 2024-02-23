//
//  LearnView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct LearnView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        TabView {
            VStack {
                Text("Let's start learning!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Imagine you've just sent a message to your friend. Let's travel with that message.")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
                    .padding(.horizontal, 50)
                
                Image(systemName: "message.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.1)
                    .foregroundColor(Color.teal)
                    .padding(25)
                
                TextAndIconView(text: "Slide to move forward", systemImage: "chevron.right", imagePosition: .right)
            }
                .tabItem {
                    Label("Let's learn!", systemImage: "circle")
                }
                .tag(0)
            
            WorkingsView()
                .tabItem {
                    Label("Inner Workings", systemImage: "circle")
                }
                .tag(1)
            
            VStack {
                
                Text("You've just learnt how the Internet works!\nNext Step: Hands-on")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                
                Text("Ready to learn about how the Internet works from the inside out?").fontWeight(.bold)
                    .multilineTextAlignment(.leading).opacity(0.5)
                
                Button(action: {tabSelection=2}, label: {
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
    LearnView(tabSelection: .constant(1))
}
