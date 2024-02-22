//
//  WorkingsPageOne.swift
//  
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct WorkingsPageOne: View {
    var body: some View {
        // -----
        
        Text("Going on a journey ✈️")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20.0)
        
        Text("The moment your message was sent, it starts on a journey around the world. First, your phone takes that message and cuts it up into smaller pieces called \"packets.\"")
            .multilineTextAlignment(.center)
        
        // -----
    }
}

#Preview {
    WorkingsView()
}
