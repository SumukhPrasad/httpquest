//
//  Game.swift
//
//
//  Created by Sumukh Prasad on 10/02/24.
//

import SwiftUI
import SpriteKit

struct Game: UIViewRepresentable {
    @Binding var score: Int

    class Coordinator: NSObject {
        var scene: GameScene?
        var scoreBinding: Binding<Int>

        init(scoreBinding: Binding<Int>) {
            self.scoreBinding = scoreBinding
            super.init()
        }

        func updateUIView(_ uiView: SKView, context: Context) {
            scene?.scoreDidChange = { [self] newScore in
                // Update the SwiftUI binding when the score changes in the GameScene
                scoreBinding.wrappedValue = newScore
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(scoreBinding: $score)
    }

    func makeUIView(context: Context) -> SKView {
        let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
        context.coordinator.scene = GameScene(size: sceneView.frame.size)
        sceneView.presentScene(context.coordinator.scene)
        return sceneView
    }

    func updateUIView(_ uiView: SKView, context: Context) {
        context.coordinator.updateUIView(uiView, context: context)
    }
}
