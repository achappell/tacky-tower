//
//  MenuNode.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

protocol MenuDelegate {
    func menu(menu: MenuNode, didChooseItem item: RoomNode)
}

class MenuNode: SKSpriteNode {
    
    override var acceptsFirstResponder: Bool { return true }
    var isOpen : Bool
    var lobbyNode : LobbyNode
    let openMenuAction : SKAction!
    let closeMenuAction : SKAction!
    var delegate : MenuDelegate?

    required init(coder aDecoder: NSCoder!) {
        self.isOpen = false
        self.lobbyNode = LobbyNode(color: NSColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), size: CGSize(width: 30, height: 10))
        super.init(coder: aDecoder)
    }
    
    init(openMenuAction : SKAction, closeMenuAction : SKAction) {
        self.isOpen = false
        self.lobbyNode = LobbyNode(texture:SKTexture(image: NSImage(named: "lobby")) ,color: NSColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0), size: CGSize(width: 30, height: 10))
        self.openMenuAction = openMenuAction
        self.closeMenuAction = closeMenuAction
        
        super.init(texture: SKTexture(image: NSImage(named: "menuBackground")), color: NSColor(red: 0.3, green: 0.2, blue: 0.4, alpha: 1), size: CGSize(width: 64, height: 64))
    }
    
    override func mouseDown(theEvent: NSEvent!) {
        let location = theEvent.locationInNode(self)
        
        if CGRectContainsPoint(self.lobbyNode.frame, location) {
            if let menuDelegate = self.delegate {
                let lobbyNodeCopy = self.lobbyNode.copy() as LobbyNode
                menuDelegate.menu(self, didChooseItem: lobbyNodeCopy)
                self.userInteractionEnabled = false
            }
        }
        super.mouseDown(theEvent)
    }
    
    func toggleMenu() {
        if self.isOpen {
            self.runAction(self.closeMenuAction) {
                self.isOpen = !self.isOpen
                self.lobbyNode.removeFromParent()
            }
        }
        else {
            self.addChild(self.lobbyNode)
            self.lobbyNode.position = CGPointZero
            self.lobbyNode.zPosition = 1
            self.runAction(self.openMenuAction) {
                self.isOpen = !self.isOpen
            }
        }
    }
}
