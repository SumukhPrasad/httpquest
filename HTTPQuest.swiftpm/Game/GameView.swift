//
//  GameView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct GameView: View {
    @Binding var tabSelection: Int
    @State private var isInstructionSheetPresented: Bool = true
    @State private var isExitSheetPresented: Bool = false
    
    var body: some View {
        
        VStack {
            
            Game()
            
            Spacer()
            
            HStack {
                Button(action: {isInstructionSheetPresented=true}, label: {
                    HStack {
                        Text("Instructions")
                        Image(systemName: "doc.questionmark.fill")
                    }
                }).buttonStyle(.bordered)
                .sheet(isPresented: $isInstructionSheetPresented) {
                    VStack {
                        ScrollView {
                                GameInstructionsView()
                        }
                        
                        Button(action: {isInstructionSheetPresented=false}, label: {
                            HStack {
                                Text("Play")
                                Image(systemName: "play.fill")
                            }
                        }).buttonStyle(.borderedProminent)
                    }.padding(20)
                    
                }
                
                Spacer()
                
                Button(action: {isExitSheetPresented=true}, label: {
                    HStack {
                        Text("Exit")
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                    }
                }).buttonStyle(.bordered)
                .alert("Exit Game", isPresented: $isExitSheetPresented) {
                    Button("No, take me back", role: .destructive) { isExitSheetPresented = false }
                    Button("Yes, exit", role: .cancel) {
                        isExitSheetPresented = false
                        tabSelection = 3
                    }
                } message: {
                    Text("Are you sure you want to exit?")
                }
            }
        }
        .padding(20)
    }
        
}

#Preview {
    GameView(tabSelection: .constant(2))
}
