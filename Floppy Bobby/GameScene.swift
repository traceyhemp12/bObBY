//
//  GameScene.swift
//  Floppy Bobby
//
//  Created by Tracey Hemphill- Wright on 12/29/17.
//  Copyright © 2017 Tracey Hemphill- Wright. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    
    override func didMove(to view: SKView) {
        
         var  birdStill = myBirds.birdStill1
        
         var bg = SKSpriteNode()
        let bgTexture = SKTexture(imageNamed:"bg.png")
        
        let moveBgAnimation = SKAction.move(by:CGVector(dx: -bgTexture.size().width, dy:0), duration:8)
        let shiftAnimation = SKAction.move(by: CGVector(dx: bgTexture.size().width, dy :0), duration: 0)
        let makeBgMove = SKAction.repeatForever(SKAction.sequence([moveBgAnimation, shiftAnimation]))
        
        var i: CGFloat = 0
        
        while i < 3
        {
            bg = SKSpriteNode(texture:bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width * i, y: self.frame.midY)
            bg.size.height = self.frame.height
            bg.run(makeBgMove)
            bg.zPosition = -1
            self.addChild(bg)
            i += 1
            
        }
        
        let birdTexture = SKTexture (imageNamed: "floppy1.png")
       // let birdTexture2 = SKTexture (imageNamed: "floppy2.png")
       // let animation = SKAction.animate(with: [birdTexture, birdTexture2], timePerFrame:0.1)
        //let makeBirdFlap = SKAction.repeatForever(animation)
        
        
        bg = SKSpriteNode(texture: bgTexture)
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.size.height = self.frame.height
        bg.run(makeBgMove)
        self.addChild(bg)
        
        birdStill = SKSpriteNode(texture: birdTexture )
        
        ///////bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
       
        birdStill.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        //bird.run(makeBirdFlap)
        
        
        self.addChild(birdStill)
        
        let ground = SKNode()
        
        ground.position = CGPoint(x: self.frame.midX, y: -self.frame.height / 2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
        ground.physicsBody!.isDynamic = false
        self.addChild(ground)
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let birdTexture = SKTexture (imageNamed: "floppy1.png")
          let birdTexture2 = SKTexture (imageNamed: "floppy2.png")
        
          let animation = SKAction.animate(with: [birdTexture, birdTexture2], timePerFrame:0.1)
        let makeBirdFlap = SKAction.repeatForever(animation)
        var birdFly = myBirds.birdFly1
        birdFly = SKSpriteNode(texture: birdTexture )
        
        birdFly.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        
        
        birdFly.run(makeBirdFlap)
        
        
        self.addChild(birdFly)
        
        
        birdFly.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
        
        birdFly.physicsBody!.isDynamic = true
        
        birdFly.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
        
        birdFly.physicsBody!.applyImpulse(CGVector(dx: 0,dy: 400))
        
        self.childNode(withName: "birdStill1")?.removeFromParent()
        
    
       
    }
    

    struct myBirds{
        static var  birdStill1 = SKSpriteNode()
        static var birdFly1 = SKSpriteNode()
            }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    
}
