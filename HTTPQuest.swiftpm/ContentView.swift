import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            SplashView().tabItem { Label("Tab 1", systemImage: "circle") }
        }
        
        
        
    }
}
