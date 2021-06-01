//
//  GameScene.swift
//  Project11
//
//  Created by Bhargav Maniar on 01/06/2021.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        addChild(background)
    }
}
