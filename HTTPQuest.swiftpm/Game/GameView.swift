//
//  GameView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct GameView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        Text("Hello, World! gv")
    }
}

#Preview {
    GameView(tabSelection: .constant(2))
}
