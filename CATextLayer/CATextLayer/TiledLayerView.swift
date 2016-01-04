//
//  TiledLayerView.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/2.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

import UIKit

let sideLength:CGFloat = 300.0
let fileName = "windingRoad"

class TiledLayerView: UIView {

    let cachesPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as String
    
    override class func layerClass() -> AnyClass {
        return CATiledLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let layer = self.layer as? CATiledLayer else { return nil }
        layer.contentsScale = UIScreen.mainScreen().scale
        layer.tileSize = CGSize(width: sideLength, height: sideLength)
    }
    
    override func drawRect(rect: CGRect) {
        let firstColumn = Int(CGRectGetMinX(rect) / sideLength)
        let lastColumn = Int(CGRectGetMaxX(rect) / sideLength)
        let firstRow = Int(CGRectGetMinY(rect) / sideLength)
        let lastRow = Int(CGRectGetMaxY(rect) / sideLength)
        
        for row in firstRow...lastRow {
            for column in firstColumn...lastColumn {
                if let tile = imageForTileAtColumn(column, row: row) {
                    let x = sideLength * CGFloat(column)
                    let y = sideLength * CGFloat(row)
                    let point = CGPoint(x: x, y: y)
                    let size = CGSize(width: sideLength, height: sideLength)
                    var tileRect = CGRect(origin: point, size: size)
                    tileRect = CGRectIntersection(bounds, tileRect)
                    tile.drawInRect(tileRect)
                }
            }
        }
    }
    
    func imageForTileAtColumn(column: Int, row: Int) -> UIImage? {
        let filePath = "\(cachesPath)/\(fileName)_\(column)_\(row)"
        return UIImage(contentsOfFile: filePath)
    }

}
