//
//  GameInstructionsView.swift
//
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct GameEndView: View {
    var body: some View {
        Text("Good going!")
            .font(.largeTitle)
            .fontWeight(.bold)
        
        Text("Congratulations on 250 points!")
            .multilineTextAlignment(.center)
            .padding(.top, 20.0)
        
        
        Text("Would you like to continue playing and aim for an even higher score or move on to the next section?")
            .multilineTextAlignment(.center)
            .padding(.top, 20.0)
    }
}

#Preview {
    GameEndView()
}
