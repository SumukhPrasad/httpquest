//
//  SplashView.swift
//  HTTPQuest
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Text("Welcome to HTTPQuest!")
                .font(.largeTitle)
            
            NavigationLink(destination: InternetView()) {
                Text("Start Exploring")
            }
        }
    }
}

#Preview {
    SplashView()
}
