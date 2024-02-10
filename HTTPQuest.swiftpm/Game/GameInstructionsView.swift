//
//  GameInstructionsView.swift
//
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct GameInstructionsView: View {
    var body: some View {
        Text("Packet Delivery Game")
            .font(.largeTitle)
            .fontWeight(.bold)
        
        Text("In this game, you'll control packets moving through a network.")
    }
}

#Preview {
    GameInstructionsView()
}
