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
    
    @State private var score: Int = 0
    
    @State private var showScoreAnimation: Bool = false
    
    
    @State private var scoreIntDivoHundred: Int = 0
    
    var body: some View {
        
        VStack {
            
            ZStack {
                Game(score: $score)
                
                if showScoreAnimation {
                    ScoreAnimationView()
                        .onAppear {
                            // Hide the animation after it completes
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                showScoreAnimation = false
                            }
                        }
                }
            }
            
            
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
                
                Text("Score: **\(score)**")
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
        .onChange(of: score) { newScore in
            // Check for score milestones
            let newScoreIntDivoHundred = newScore / 100
            print(newScoreIntDivoHundred)
            if newScoreIntDivoHundred > scoreIntDivoHundred {
                withAnimation {
                    showScoreAnimation = true
                }
            }
            scoreIntDivoHundred = newScoreIntDivoHundred
        }
    }
}

struct ScoreAnimationView: View {
    var body: some View {
        // Customize the animation view here
        Text("Score Milestone Reached!")
            .foregroundColor(.green)
            .font(.headline)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .border(Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    GameView(tabSelection: .constant(2))
}
