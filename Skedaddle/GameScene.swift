//
//  GameScene.swift
//  Skedaddle
//
//  Created by chantel Frizzell on 11/6/14.
//  Copyright (c) 2014 NOidea. All rights reserved.
//

import SpriteKit

        var ship = SKSpriteNode()

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        
        //Phil's ship
        var shipTexture1 = SKTexture(imageNamed: "ship01")
        shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
        var shipTexture2 = SKTexture(imageNamed: "ship02")
        shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
        var shipTexture3 = SKTexture(imageNamed: "ship03")
        shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
        var shipTexture4 = SKTexture(imageNamed: "ship04")

        // animate the ship
        var animation = SKAction.animateWithTextures([shipTexture1, shipTexture2, shipTexture3, shipTexture4], timePerFrame: 0.2)
        var engineGo = SKAction.repeatActionForever(animation)

        // set the ship's position relative to the frame:
        ship = SKSpriteNode(texture: shipTexture1)
        ship.setScale(0.7)
        ship.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        ship.runAction(engineGo)

        // add ship's physics
        ship.physicsBody = SKPhysicsBody(circleOfRadius: ship.size.height / 2.0)
        ship.physicsBody?.dynamic = true
        ship.physicsBody?.allowsRotation = false

        // add ship to the scene:
        self.addChild(ship)
        
        //ground
        //first deal with the image and make it move
        var groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        //move the ground
        var moveGroundSprite = SKAction.moveByX(-groundTexture.size().width, y: 0, duration: NSTimeInterval(0.01 * groundTexture.size().width))
        var resetGroundSprite = SKAction.moveByX(groundTexture.size().width, y: 0, duration: 0.0)
        var moveGroundSpriteForever = SKAction.repeatActionForever(SKAction.sequence([moveGroundSprite, resetGroundSprite]))
        
        for var i:CGFloat = 0; i<2 + self.frame.size.width / (groundTexture.size().width); ++i {
            var sprite = SKSpriteNode(texture: groundTexture)
            sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2)
            sprite.runAction(moveGroundSpriteForever)
            self.addChild(sprite)
            
            //now add the dummy ground
            var dummyGround  = SKNode()
            dummyGround.position = CGPointMake(0, groundTexture.size().height / 2)
            dummyGround.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, groundTexture.size().height))
            dummyGround.physicsBody?.dynamic = false
            self.addChild(dummyGround)
        }
    }
}

