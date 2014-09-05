//
//  MenuController.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

class MenuController: NSObject {
    
    var menuNode : MenuNode
    let openMenuAction : SKAction
    let closeMenuAction : SKAction
    var isOpen : Bool
    
    init(position: CGPoint, openMenuAction: SKAction, closeMenuAction: SKAction) {
        self.menuNode = MenuNode(texture: SKTexture(image: NSImage(named: "menuBackground")), color: NSColor(red: 0.3, green: 0.2, blue: 0.4, alpha: 1), size: CGSize(width: 64, height: 64))
        self.menuNode.centerRect = CGRectMake(12.0/28.0,12.0/28.0,4.0/28.0,4.0/28.0)
        self.menuNode.xScale = 4
        self.menuNode.yScale = 4
        self.menuNode.position = position
        
        self.openMenuAction = openMenuAction
        self.closeMenuAction = closeMenuAction
        
        self.isOpen = false
        
        super.init()
    }
    
    func toggleMenu() {
        if self.isOpen {
            self.menuNode.runAction(self.closeMenuAction) {
                self.isOpen = !self.isOpen
            }
        }
        else {
            self.menuNode.runAction(self.openMenuAction) {
                self.isOpen = !self.isOpen
            }
        }
    }
    
    func nodeToDraw() -> SKNode {
        return menuNode
    }
}
