//
//  PacketNode.swift
//
//
//  Created by Sumukh Prasad on 24/02/24.
//

import SpriteKit

class PacketNode: SKSpriteNode {
    var labelNode: SKLabelNode?

    init(label: String) {
        let texture = SKTexture(imageNamed: "Packet")
        super.init(texture: texture, color: .clear, size: texture.size())
        super.name = label
        
        let monospacedFont = UIFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: monospacedFont,
            .foregroundColor: UIColor.white
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
