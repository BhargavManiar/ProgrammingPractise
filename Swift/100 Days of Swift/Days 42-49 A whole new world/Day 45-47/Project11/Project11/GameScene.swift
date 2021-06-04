//
//  GameScene.swift
//  Project11
//
//  Created by Bhargav Maniar on 01/06/2021.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let ballColours = ["ballPurple", "ballBlue", "ballCyan", "ballGreen", "ballRed", "ballYellow", "ballGrey"]
    
//    var scoreLabel: SKLabelNode!
    var remainingBallsLabel: SKLabelNode!
    var gameFinishedLabel: SKLabelNode!
    var playAgainLabel: SKLabelNode!
    var gameFinished: Bool = false
//    var editLabel: SKLabelNode!
    
//    var score = 0 {
//        didSet {
//            scoreLabel.text = "Score \(score)"
//        }
//    }
    var remaingBalls = 5 {
        didSet {
            remainingBallsLabel.text = "Balls left: \(remaingBalls)"
        }
    }
    
//    var editingMode: Bool = false {
//        didSet {
//            if editingMode {
//                editLabel.text = "Done"
//            } else {
//                editLabel.text = "Edit"
//            }
//        }
//    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
//        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
//        scoreLabel.text = "Score 0"
//        scoreLabel.horizontalAlignmentMode = .right
//        scoreLabel.position = CGPoint(x: 980, y: 700)
//        addChild(scoreLabel)
        
        remainingBallsLabel = SKLabelNode(fontNamed: "Chalkduster")
        remainingBallsLabel.text = "Balls left: \(remaingBalls)"
        remainingBallsLabel.horizontalAlignmentMode = .right
        remainingBallsLabel.position = CGPoint(x: 980, y: 700)
        addChild(remainingBallsLabel)
        
//        editLabel = SKLabelNode(fontNamed: "Chalkduster")
//        editLabel.text = "Edit"
//        editLabel.position = CGPoint(x: 80, y: 700)
//        addChild(editLabel)
        
        playAgainLabel = SKLabelNode(fontNamed: "Chalkduster")
        playAgainLabel.horizontalAlignmentMode = .center
        playAgainLabel.position = CGPoint(x: 512, y: 384)
        playAgainLabel.text = ""
        addChild(playAgainLabel)
        
        gameFinishedLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameFinishedLabel.horizontalAlignmentMode = .center
        gameFinishedLabel.position = CGPoint(x: 512, y: 484)
        gameFinishedLabel.text = ""
        addChild(gameFinishedLabel)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
        startGame()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let objects = nodes(at: location)
        if remaingBalls > 0 && !gameFinished{
            let ball = SKSpriteNode(imageNamed:  ballColours.randomElement()!)
            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
            ball.physicsBody?.restitution = 0.4
            ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
            ball.position = CGPoint(x: location.x, y: 650)
            ball.name = "ball"
            remaingBalls -= 1
            addChild(ball)
        }
        
        if objects.contains(playAgainLabel) {
            startGame()
        }
        
//        if objects.contains(editLabel) {
//            editingMode.toggle()
//        } else {
//            if editingMode {
//                // create a box
//                let size = CGSize(width: Int.random(in: 16...128), height: 16)
//                let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
//                box.zRotation = CGFloat.random(in: 0...3)
//                box.position = location
//                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
//                box.physicsBody?.isDynamic = false
//                box.name = "box"
//                addChild(box)
//            } else {
//                if remaingBalls > 0 {
//                    let ball = SKSpriteNode(imageNamed:  ballColours.randomElement()!)
//                    ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
//                    ball.physicsBody?.restitution = 0.4
//                    ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
//                    ball.position = CGPoint(x: location.x, y: 650)
//                    ball.name = "ball"
//                    remaingBalls -= 1
//                    addChild(ball)
//                }
//            }
//        }
    }
    
    func makeBouncer(at position:CGPoint) {
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
        bouncer.physicsBody?.isDynamic = false // Object will not move on collisions, it is static
        addChild(bouncer)
    }
    
    func makeSlot(at position: CGPoint, isGood: Bool) {
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        } else {
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        
        slotBase.position = position
        slotGlow.position = position
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        addChild(slotBase)
        addChild(slotGlow)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spinForever)
    }
    
    func collision(between ball: SKNode, object: SKNode) {
        if object.name == "box" {
            object.removeFromParent() // Remove the box if there is a collision
        } else if object.name == "good" {
            destroy(ball: ball)
//            score += 1
            remaingBalls += 1
        } else if object.name == "bad" {
            destroy(ball: ball)
//            score -= 1
        }
        checkGameState()
    }
    
    func destroy(ball: SKNode) {
        if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
            fireParticles.position = ball.position
            addChild(fireParticles)
        }
        
        ball.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if contact.bodyA.node?.name == "ball" {
            collision(between: nodeA, object: nodeB)
        } else if contact.bodyB.node?.name == "ball" {
            collision(between: nodeB, object: nodeA)
        }
    }
    
    func boxesPresent() -> Bool{
        for node in self.children {
            if node.name == "box" {
                return true;
            }
        }
        return false
    }
    
    func ballsOnScreen() -> Bool{
        for node in self.children {
            if node.name == "ball" {
                return true
            }
        }
        return false
    }
    
    func finishGame(didWin status: Bool) {
        gameFinished = true
        if status {
            gameFinishedLabel.text = "You Won!"
        } else {
            gameFinishedLabel.text = "You Lost"
        }
        playAgainLabel.text = "Play Again?"
    }
    
    func checkGameState() {
        // Check if remaining boxes are 0
        if !boxesPresent() { // Winning case
            finishGame(didWin: true)
        } else if remaingBalls == 0 && !ballsOnScreen(){ // Losing case
            finishGame(didWin: false)
        }
    }
    
    func generateRandomBoxes() {
        // create a box
        for _ in 1...10 {
            let size = CGSize(width: Int.random(in: 16...128), height: 16)
            let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
            box.zRotation = CGFloat.random(in: 0...3)
            box.position = CGPoint(x: Int.random(in: 12...1012), y: Int.random(in: 12...600))
            box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
            box.physicsBody?.isDynamic = false
            box.name = "box"
            addChild(box)
        }
    }
    
    func startGame() {
        remaingBalls = 5;
        gameFinishedLabel.text = ""
        playAgainLabel.text = ""
        gameFinished = false
        
        for node in self.children {
            if node.name == "box" || node.name == "ball"{
                node.removeFromParent()
            }
        }
        
        generateRandomBoxes();
    }
}
