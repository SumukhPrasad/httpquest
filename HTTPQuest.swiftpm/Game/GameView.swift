//
//  GameView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct GameView: View {
    @Binding var tabSelection: Int
    @State private var isSheetPresented: Bool = true
    
    var body: some View {
        Text("Hello, World! gv")
        .sheet(isPresented: $isSheetPresented) {
            // Content of your sheet goes here
            GameInstructionsView()
        }
    }
        
}

#Preview {
    GameView(tabSelection: .constant(2))
}
