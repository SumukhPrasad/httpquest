//
//  File.swift
//  
//
//  Created by Sumukh Prasad on 24/02/24.
//

import Foundation
import SpriteKit
import SwiftUI

class ScoreIndicatorNode: SKNode {
    private var backgroundNode: SKSpriteNode?
    private var labelNode: SKLabelNode?

    init(score: Int) {
        super.init()


        // Create and configure the label node
        labelNode = SKLabelNode(text: (score > 0 ? "+" : "-") + "\(abs(score))")
        labelNode?.fontColor = score > 0 ? .green : .red
        labelNode?.fontSize = 12  // Adjust the font size as needed
        labelNode?.position = CGPoint(x: 0, y: -2)  // Adjust position for centering
        addChild(labelNode!)
        
        let backgroundNode = SKShapeNode(rectOf: CGSize(width: 30, height: 20), cornerRadius: 5)
        backgroundNode.fillColor = SKColor(white: 1.0, alpha: 0.5)
        backgroundNode.strokeColor = .gray
        backgroundNode.lineWidth = 1.0
        addChild(backgroundNode)
        
        let monospacedFont = UIFont.monospacedSystemFont(ofSize: 12, weight: .bold)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: monospacedFont,
            .foregroundColor: score > 0 ? UIColor(hue: 0.3, saturation: 0.8, brightness: 0.7, alpha: 1.0) : UIColor.red
        ]
        let attributedString = NSAttributedString(string: (score > 0 ? "+" : "-") + "\(abs(score))", attributes: attributes)
        let labelNode = SKLabelNode(attributedText: attributedString)
        labelNode.verticalAlignmentMode = .center
        addChild(labelNode)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
