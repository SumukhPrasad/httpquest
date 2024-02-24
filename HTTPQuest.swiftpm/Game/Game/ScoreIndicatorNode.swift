//
//  File.swift
//  
//
//  Created by Sumukh Prasad on 24/02/24.
//

import Foundation
import SpriteKit

class ScoreIndicatorNode: SKLabelNode {
    init(score: Int) {
        super.init()
        text = (score > 0 ? "+" : "-") + "\(abs(score))"
        fontColor = score > 0 ? .green : .red
        fontSize = 20
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
