//
//  GameScene.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var placeableNode : SKShapeNode
    var menuLabelNode : SKLabelNode
    var menuController : MenuController
    
    required init(coder aDecoder: NSCoder!) {
        self.placeableNode = SKShapeNode()
        self.menuLabelNode = SKLabelNode()
        self.menuController = MenuController(position: CGPoint(x: -128.0, y: 200.0), openMenuAction: SKAction.moveByX(256, y: 0, duration: 0.5), closeMenuAction: SKAction.moveByX(-256, y: 0, duration: 0.5))
        
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.placeableNode = SKShapeNode(rectOfSize: CGSize(width: 100, height: 20))
        self.placeableNode.strokeColor = NSColor(white: 0.5, alpha: 1)
       // self.addChild(placeableNode)
        
        self.menuLabelNode = SKLabelNode(text: "Menu")
        self.menuLabelNode.position = CGPoint(x: 20, y: 30)
        self.menuLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        self.addChild(menuLabelNode)
        
        self.addChild(self.menuController.nodeToDraw())
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        
        if CGRectContainsPoint(self.menuLabelNode.frame, location) {
            self.menuController.toggleMenu()
        }
    }
    
    override func mouseMoved(theEvent: NSEvent!) {
        //self.placeableNode.position = theEvent.locationInNode(self)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
