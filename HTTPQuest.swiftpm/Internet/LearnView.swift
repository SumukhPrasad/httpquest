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
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "circle")
                }
                .tag(0)
            
            WorkingsView()
                .tabItem {
                    Label("Inner Workings", systemImage: "circle")
                }
                .tag(1)
            
            CurrentView()
                .tabItem {
                    Label("Current Conncetivity", systemImage: "circle")
                }
                .tag(2)
            
            VStack {
                Text("Next Step: Hands-on")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
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
                .tag(3)
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
