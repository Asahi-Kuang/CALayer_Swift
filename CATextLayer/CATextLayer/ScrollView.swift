//
//  ScrollView.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class ScrollView: UIView {

    override class func layerClass() -> AnyClass {
        return CAScrollLayer.self
    }

}
