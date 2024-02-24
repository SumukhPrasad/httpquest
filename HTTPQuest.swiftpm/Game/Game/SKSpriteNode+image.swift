//
//  SKSpriteNode+image.swift
//  
//
//  Created by Sumukh Prasad on 24/02/24.
//

import SpriteKit

extension SKSpriteNode {
    convenience init(imageName: String, size: CGSize, color: UIColor) {
        let image = UIImage(named: imageName)
        let texture = SKTexture(image: image!)

        self.init(texture: texture, color: color, size: size)
    }
}
