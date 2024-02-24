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
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Each device is labeled either with a 2-digit address (routers) or with \"IH\" (Internet Hubs). ")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Packets will appear with an address on them. Your job is to help the packets reach their destination.")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("If you find a router with a matching address, drag and drop the packet to that router. If you don't find a router with a matching address, drag and drop it to an Internet Hub.")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Points will be awarded for correct routing and deducted for incorrect routing.")
                }
            }
        }
        
    }
}

#Preview {
    GameInstructionsView()
}
