//
//  MenuNode.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

class MenuNode: SKSpriteNode {
    
    override var acceptsFirstResponder: Bool { return true }
    var isOpen : Bool
    var placeableNode : SKSpriteNode
    var isDraggingNode : Bool
    let openMenuAction : SKAction!
    let closeMenuAction : SKAction!

    required init(coder aDecoder: NSCoder!) {
        self.isOpen = false
        self.placeableNode = SKSpriteNode(color: NSColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), size: CGSize(width: 30, height: 10))
        self.isDraggingNode = false
        super.init(coder: aDecoder)
    }
    
    init(openMenuAction : SKAction, closeMenuAction : SKAction) {
        self.isOpen = false
        self.placeableNode = SKSpriteNode(texture:SKTexture(image: NSImage(named: "lobby")) ,color: NSColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), size: CGSize(width: 30, height: 10))
        self.isDraggingNode = false
        self.openMenuAction = openMenuAction
        self.closeMenuAction = closeMenuAction
        
        super.init(texture: SKTexture(image: NSImage(named: "menuBackground")), color: NSColor(red: 0.3, green: 0.2, blue: 0.4, alpha: 1), size: CGSize(width: 64, height: 64))
    }
    
    override func mouseDown(theEvent: NSEvent!) {
        let location = theEvent.locationInNode(self)
        
        if CGRectContainsPoint(self.placeableNode.frame, location) {
            self.isDraggingNode = !self.isDraggingNode
        }
    }
    
    override func mouseMoved(theEvent: NSEvent!) {
        if self.isDraggingNode {
            self.placeableNode.position = theEvent.locationInNode(self)
        }
    }
    
    func toggleMenu() {
        if self.isOpen {
            self.runAction(self.closeMenuAction) {
                self.isOpen = !self.isOpen
                self.placeableNode.removeFromParent()
            }
        }
        else {
            self.addChild(self.placeableNode)
            self.placeableNode.position = CGPointZero
            self.placeableNode.zPosition = 1
            self.runAction(self.openMenuAction) {
                self.isOpen = !self.isOpen
            }
        }
    }
}
