//
//  ScrollLayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class ScrollLayerViewController: UIViewController {

    @IBOutlet var viewForLayer: ScrollView!
    @IBOutlet var horizenSwitch: UISwitch!
    @IBOutlet var verticalSwitch: UISwitch!
    
    var scrollingLayer: CAScrollLayer {
        return viewForLayer.layer as! CAScrollLayer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpScrollLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpScrollLayer() {
        scrollingLayer.masksToBounds = true
    }

    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        
        var newPoint = viewForLayer.bounds.origin
        newPoint.x -= sender.translationInView(viewForLayer).x
        newPoint.y -= sender.translationInView(viewForLayer).y
        sender.setTranslation(CGPointZero, inView: viewForLayer)
        scrollingLayer.scrollToPoint(newPoint)
        
        if sender.state == .Ended {
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                //
                self.scrollingLayer.scrollToPoint(CGPointZero)
                }, completion: nil)
        }
    }
    
    @IBAction func setScrollWay(sender: UISwitch) {
        
        let switchUp = self.view.viewWithTag(1) as! UISwitch
        let switchDown = self.view.viewWithTag(2) as! UISwitch
        
        switch (switchUp.on, switchDown.on) {
        case (true, true):
            scrollingLayer.scrollMode = kCAScrollBoth
        case (true, false):
            scrollingLayer.scrollMode = kCAScrollHorizontally
        case (false, true):
            scrollingLayer.scrollMode = kCAScrollVertically
        case (false, false):
            scrollingLayer.scrollMode = kCAScrollNone
        
        }
        
    }
    
}
