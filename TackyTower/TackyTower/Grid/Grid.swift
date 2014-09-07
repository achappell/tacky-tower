//
//  Grid.swift
//  TackyTower
//
//  Created by Amanda Chappell on 9/6/14.
//  Copyright (c) 2014 AmplifiedProjects. All rights reserved.
//

import Cocoa

struct GridUnit {
    var row : Int = 0
    var column : Int = 0
}

class Grid: NSObject {
    
    let columns : Int
    let rows : Int
    let size : CGSize
    private let gridUnitSize : CGSize
    
    init(rows: Int, columns: Int, size: CGSize) {
        self.columns = columns
        self.rows = rows
        self.size = size
        
        self.gridUnitSize = CGSize(width: Int(self.size.width / CGFloat(columns)), height: Int(self.size.height / CGFloat(rows)))
        
        super.init()
    }
    
    func snapToGridPositionForPosition(position: CGPoint) -> CGPoint {
        var gridUnit = self.gridUnitForPosition(position)
        return CGPoint(x: (CGFloat(gridUnit.column) * self.gridUnitSize.width), y: (CGFloat(gridUnit.row) * self.gridUnitSize.height))
    }

    func gridUnitForPosition(position: CGPoint) -> GridUnit {
        var gridUnit = GridUnit()
        gridUnit.row =  Int(position.y / self.gridUnitSize.height)
        gridUnit.column = Int(position.x / self.gridUnitSize.width)
        return gridUnit
    }
}
