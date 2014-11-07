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
        
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
//    
//    }
//    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        /* Called when a touch begins */
//    }
//    
//   
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }


//Phil's ship

var shipTexture1 = SKTexture(imageNamed: "ship01")
shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
var shipTexture2 = SKTexture(imageNamed: "ship02")
shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
var shipTexture3 = SKTexture(imageNamed: "ship03")
shipTexture1.filteringMode = SKTextureFilteringMode.Nearest
var shipTexture4 = SKTexture(imageNamed: "ship04")

/* animate the ship*/
var animation = SKAction.animateWithTextures([shipTexture1, shipTexture2, shipTexture3, shipTexture4], timePerFrame: 0.2)
var engineGo = SKAction.repeatActionForever(animation)

/* set the ship's position relative to the frame: */
ship = SKSpriteNode(texture: shipTexture1)
ship.setScale(0.5)
ship.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
ship.runAction(engineGo)

/* add ship's physics */
ship.physicsBody = SKPhysicsBody(circleOfRadius: ship.size.height / 2.0)
ship.physicsBody?.dynamic = true
ship.physicsBody?.allowsRotation = false



/* add bird to the scene: */
self.addChild(ship)

}
}