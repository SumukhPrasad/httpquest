//
//  AboutContentView.swift
//  
//
//  Created by Sumukh Prasad on 09/02/24.
//

import SwiftUI

struct AboutContentView: View {
    var body: some View {
        
        // -----
        
        Text("What's this project about?")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20.0)
        
        Text("Hey there! I'm Sumukh Prasad, a student and self-taught developer. This project is about learning how the Internet works, and its aim is to educate people about how this indispensable tool that we use every single day works behind the scenes. The project has 3 sections —")
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Introduction (you're here!)").fontWeight(.bold)
                    
                    Text("This section tells you about this project and why it's important that we learn how the Internet works.")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Learn").fontWeight(.bold)
                    
                    Text("In this section, you'll learn about the history, the inner workings, and the current reach of the Internet.")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Play").fontWeight(.bold)
                    
                    Text("In this section, you'll play a Packet Delivery Game where you'll help Internet packets reach their destination.")
                }
            }
        }
        
        // -----
        
        /* Text("Why should we know how the Internet works?")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20.0)
        
        Text("When people and computers connect, the value of computing increases. The Internet has become a fundamental part of daily life. Knowing how it works helps us make the most of what it has to offer. It helps us engage responsibly with the world online.")
        
        Text("Being digitally literate also helps us better protect ourselves from online threats. Understanding the potential risks on the Internet is crucial for personal cybersecurity.") */
        
        // -----
        
        Text("Ready to learn how the Internet works?")
        .padding(.top, 20.0)
        
    }
}

#Preview {
    AboutView()
}
