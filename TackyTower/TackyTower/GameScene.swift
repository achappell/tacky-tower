//
//  GameScene.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/4/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, MenuDelegate {
    
    var menuLabelNode : SKLabelNode
    var menuNode : MenuNode
    var draggingNode : RoomNode?
    var grid : Grid!
    
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
        self.menuNode.delegate = self
        
        self.menuLabelNode.position = CGPoint(x: 20, y: 30)
        self.menuLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        self.addChild(menuLabelNode)
        
        self.grid = Grid(rows: 40, columns: 60, size: self.frame.size)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        
        if CGRectContainsPoint(self.menuLabelNode.frame, location) {
            self.menuNode.toggleMenu()
        }
        if let aDraggingNode = self.draggingNode {
            self.draggingNode = nil
        }
        super.mouseDown(theEvent)
    }
    
    override func mouseMoved(theEvent: NSEvent!) {
        if let aDraggingNode = self.draggingNode {
            let position = theEvent.locationInNode(self)
            let topLeftPoint = CGPoint(x: position.x - aDraggingNode.size.width / 2.0, y: position.y - aDraggingNode.size.height)
            
            let newPosition = self.grid.snapToGridPositionForPosition(topLeftPoint)
            
            aDraggingNode.position = CGPoint(x: newPosition.x + aDraggingNode.size.width / 2.0, y: newPosition.y + aDraggingNode.size.height)
        }
        super.mouseMoved(theEvent)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    // MARK: MenuDelegate
    
    func menu(menu: MenuNode, didChooseItem item: RoomNode) {
        
        self.draggingNode = item
        item.xScale = 4
        item.yScale = 4
        item.zPosition = 1000
        
        self.addChild(item)
        
    }
}
