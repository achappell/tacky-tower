//
//  GameScene.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var menuLabelNode : SKLabelNode
    var menuNode : MenuNode
    
    required init(coder aDecoder: NSCoder!) {
        self.menuLabelNode = SKLabelNode(text: "Menu")
        self.menuNode = MenuNode(openMenuAction: SKAction.moveByX(256, y: 0, duration: 0.5), closeMenuAction: SKAction.moveByX(-256, y: 0, duration: 0.5))
        
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        self.menuNode.centerRect = CGRectMake(12.0/28.0,12.0/28.0,4.0/28.0,4.0/28.0)
        self.menuNode.xScale = 4
        self.menuNode.yScale = 4
        self.menuNode.position = CGPoint(x: -128.0, y: 200.0)
        self.menuNode.userInteractionEnabled = true
        self.addChild(self.menuNode)
        
        self.menuLabelNode.position = CGPoint(x: 20, y: 30)
        self.menuLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        self.addChild(menuLabelNode)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        
        if CGRectContainsPoint(self.menuLabelNode.frame, location) {
            self.menuNode.toggleMenu()
        }
        super.mouseDown(theEvent)
    }
    
    override func mouseMoved(theEvent: NSEvent!) {
        //self.placeableNode.position = theEvent.locationInNode(self)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
