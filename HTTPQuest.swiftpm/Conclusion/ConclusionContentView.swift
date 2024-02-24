//
//  ConclusionContentView.swift
//
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI

struct ConclusionContentView: View {
    var body: some View {
        Text("Let's see what we learnt!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20.0)
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Learn").fontWeight(.bold)
                    
                    Text("In this section, we learnt how the internet works by following a message across the world.")
                }
            }
            
            HStack(alignment: .top, spacing: 10) {
                Text("•")
                VStack(alignment: .leading) {
                    Text("Play").fontWeight(.bold)
                    
                    Text("In this section, we played a game that simulated how the internet works by letting us control packets flowing through a network.")
                }
            }
        }
        
        
    
        Text("I hope you enjoyed learning about the internet!")
    
    }
}

#Preview {
    ConclusionContentView()
}
