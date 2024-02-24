//
//  NetworkNode.swift
//
//
//  Created by Sumukh Prasad on 24/02/24.
//

import SpriteKit

class NetworkNode: SKSpriteNode {
    var nodeType: NodeType
    var labelNode: SKLabelNode?
    
    init(type: NodeType, texture: SKTexture, size: CGSize, label: String) {
        self.nodeType = type
        super.init(texture: texture, color: .clear, size: size)
        super.name = label
        
        let backgroundNode = SKShapeNode(rectOf: CGSize(width: size.width*0.8, height: 16), cornerRadius: 5)
        backgroundNode.fillColor = SKColor(white: 1.0, alpha: 0.5)
        backgroundNode.strokeColor = .gray
        backgroundNode.lineWidth = 1.0
        addChild(backgroundNode)
        
        let monospacedFont = UIFont.monospacedSystemFont(ofSize: 12, weight: .bold)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: monospacedFont
        ]
        let attributedString = NSAttributedString(string: label, attributes: attributes)
        let labelNode = SKLabelNode(attributedText: attributedString)
        labelNode.verticalAlignmentMode = .center
        addChild(labelNode)
        self.labelNode = labelNode
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum NodeType {
    case router
    case hub
}
