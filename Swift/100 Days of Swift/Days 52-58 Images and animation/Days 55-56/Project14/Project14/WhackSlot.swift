//
//  WhackSlot.swift
//  Project14
//
//  Created by Bhargav Maniar on 20/07/2021.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    var charNode: SKSpriteNode!
    
    var isVisible = false
    var isHit = false
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
    func show(hideTime: Double) {
        if isVisible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [weak self] in self?.hide() }
        
        mudEffect(goingUp: true) // ! Show Mud Particle Effect
    }
    
    func hide() {
        if !isVisible { return } // Return if already hidden
        
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
        
        mudEffect(goingUp: false) // ! Show Mud Particle Effect
    }
    
    func hit() {
        isHit = true
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        let notVisible = SKAction.run { [weak self] in self?.isVisible = false }
        let sequenece = SKAction.sequence([delay, hide, notVisible])
        charNode.run(sequenece)
        
        smokeEffect() // ! Show Smoke Particle Effect
    }
    
    // Particle Effects
    
    func smokeEffect() {
        if let smoke = SKEmitterNode(fileNamed: "SmokeParticleEffect") {
            smoke.position = CGPoint(x: 0, y: 40)
            smoke.zPosition = 1
            smoke.numParticlesToEmit = 10
            smoke.particleLifetime = 0.75
            smoke.particleColor = SKColor.black
            smoke.particleAlpha = 0.2
            
            playEffect(effect: smoke)
        }
    }
    
    func mudEffect(goingUp: Bool) {
        if let mud = SKEmitterNode(fileNamed: "MudParticleEffect") {
            mud.position = CGPoint(x: 0, y: 0)
            mud.zPosition = 1
            mud.numParticlesToEmit = 70
            mud.particleBirthRate = 500
            mud.particleSize = CGSize(width: 30, height: 30)
            mud.particleColor = SKColor.brown
            mud.particleBlendMode = .replace
            
            if goingUp {
                mud.particleLifetime = 0.30
                mud.particleSpeed = 1
                mud.particleSpeedRange = 300
            } else {
                mud.particleLifetime = 0.10
                mud.particleSpeed = 100
                mud.particleSpeedRange = 0
            }
            
            playEffect(effect: mud)
        }
    }
    
    func playEffect(effect: SKEmitterNode)  {
        let action = SKAction.run { [weak self] in self?.addChild(effect) }
        let duration = SKAction.wait(forDuration: 2)
        let removal = SKAction.run { [weak self ] in self?.removeChildren(in: [effect]) }
        run(SKAction.sequence([action, duration, removal]))
    }
}
