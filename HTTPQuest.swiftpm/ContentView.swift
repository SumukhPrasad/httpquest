import SwiftUI

struct ContentView: View {
    @State private var currentTab = 0
    
    var body: some View {

        TabView(selection: $currentTab) {
            SplashView(tabSelection: $currentTab).tabItem { Label("Hello!", systemImage: "circle") }.tag(0)
            
            LearnView(tabSelection: $currentTab).tabItem { Label("Learn", systemImage: "brain.fill") }.tag(1)
            
            GameView(tabSelection: $currentTab).tabItem { Label("Play", systemImage: "gamecontroller") }.tag(2)
            
            ConclusionView(tabSelection: $currentTab).tabItem { Label("Recap", systemImage: "heart.circle") }.tag(3)
        }.ignoresSafeArea()
        
    }
}
