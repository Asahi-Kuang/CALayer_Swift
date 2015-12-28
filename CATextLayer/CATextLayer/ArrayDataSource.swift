//
//  ArrayDataSource.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

typealias cellConfigureBlock = (AnyObject, AnyObject) -> Void
class ArrayDataSource: NSObject, UITableViewDataSource {
    
    var block: cellConfigureBlock?
    var reuseIdentifier: String?
    var items: Array<AnyObject>?
    var isSystemCell: Bool?
    
    init(items: Array<AnyObject>, reuseIdentifier: String, block: cellConfigureBlock, isSystemCell: Bool) {
        //
        self.block = block
        self.reuseIdentifier = reuseIdentifier
        self.items = items
        self.isSystemCell = isSystemCell
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.items![indexPath.row]
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = objectAtIndexPath(indexPath)
        if isSystemCell! {
            var cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier!)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: self.reuseIdentifier)
            }
            else {
                while cell!.contentView.subviews.last != nil {
                    cell!.contentView.subviews.last!.removeFromSuperview()
                }
            }
            self.block!(cell!, item)
            cell!.accessoryType = .DisclosureIndicator
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier!, forIndexPath: indexPath)
            
            self.block!(cell, item)
            cell.accessoryType = .DisclosureIndicator
            return cell
        }
    }
    
}
