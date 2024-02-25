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
    @State private var scoreIsReasonablyHigh: Bool = false
    @State private var scoreMilestoneCardOpacity: Double = 0.0
    @State private var scoreLimitDismissed: Bool = false
    var body: some View {
        
        VStack {
            
            
            Text("Score: **\(score)**")
                .font(.title)
            
            Spacer()
            
            ZStack {
                Game(score: $score)
                    .sheet(isPresented: $scoreIsReasonablyHigh) {
                        VStack {
                            Spacer()
                            GameEndView()
                            Spacer()
                            HStack {
                                Button(action: {scoreLimitDismissed=true; scoreIsReasonablyHigh=false}, label: {
                                    HStack {
                                        Text("Continue playing")
                                        Image(systemName: "play.fill")
                                    }
                                }).buttonStyle(.bordered)
                                Spacer()
                                Button(action: {scoreLimitDismissed=true; scoreIsReasonablyHigh=false; tabSelection = 3}, label: {
                                    HStack {
                                        Text("Exit the game")
                                        Image(systemName: "door.left.hand.open")
                                    }
                                }).buttonStyle(.borderedProminent)
                            }
                        }.padding(20)
                    }
                
                if showScoreAnimation {
                    ScoreAnimationView()
                        .opacity(scoreMilestoneCardOpacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                withAnimation {
                                    scoreMilestoneCardOpacity = 0.0
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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
                        Spacer()
                        GameInstructionsView()
                        Spacer()
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
        .onChange(of: score) { newScore in
            let newScoreIntDivoHundred = newScore / 100
            
            if newScoreIntDivoHundred > scoreIntDivoHundred {
                withAnimation {
                    showScoreAnimation = true
                    scoreMilestoneCardOpacity = 1.0
                }
            }
            
            if !scoreLimitDismissed {
                scoreIsReasonablyHigh = (score > 250)
            }
            
            scoreIntDivoHundred = newScoreIntDivoHundred
        }
    }
}

struct ScoreAnimationView: View {
    var body: some View {
        Text("Good going!")
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.headline)
            .padding()
            .background(Color.init(hue: 0.3, saturation: 0.8, brightness: 0.7))
            .cornerRadius(10)
    }
}


#Preview {
    GameView(tabSelection: .constant(2))
}
