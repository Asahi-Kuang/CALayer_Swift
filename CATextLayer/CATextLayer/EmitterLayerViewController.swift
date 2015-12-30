//
//  EmitterLayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/29.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class EmitterLayerViewController: UIViewController {

    @IBOutlet var viewForLayer: UIView!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    let emitterLayer = CAEmitterLayer()
    let emitterCell  = CAEmitterCell()
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        setUpLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: --
    
    // MARK: - Methods
    func setUpLayer() {
        emitterLayer.frame = viewForLayer.bounds
        emitterLayer.backgroundColor = UIColor.blackColor().CGColor
        emitterLayer.masksToBounds = true
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.seed = UInt32(NSDate().timeIntervalSince1970)
        emitterLayer.drawsAsynchronously = true
        
        emitterLayer.emitterCells = [emitterCell]
        l.addSublayer(emitterLayer)
        
        setEmitterPosition(CGRectGetMidX(viewForLayer!.bounds), y: 0)
        setEmitterCell()
    }
    
    func setEmitterCell() {
        emitterCell.contents = UIImage(named: "smallStar")?.CGImage
        emitterCell.velocity = 50.0
        emitterCell.velocityRange = 500.0
        
        emitterCell.color = UIColor.blackColor().CGColor
        emitterCell.scale = 1.0
        emitterCell.redRange = 1.0
        emitterCell.greenRange = 1.0
        emitterCell.blueRange = 1.0
        emitterCell.alphaRange = 0.0
        emitterCell.redSpeed = 0.5
        emitterCell.greenSpeed = 0.5
        emitterCell.blueSpeed = 0.5
        emitterCell.alphaSpeed = -0.5
        
        let zeroDegreesInRadians = degressToRadians(0.0)
        emitterCell.spin = zeroDegreesInRadians
        emitterCell.spinRange = zeroDegreesInRadians
        emitterCell.emissionRange = degressToRadians(360.0)
        
        emitterCell.lifetime = 1.0
        emitterCell.birthRate = 250.0
        emitterCell.xAcceleration = 200.0
        emitterCell.yAcceleration = 500.0
        
    }
    
    func degressToRadians(degrees: Double) -> CGFloat {
        return CGFloat(degrees * M_PI / 180.0)
    }
    
    func setEmitterPosition(x: CGFloat, y: CGFloat) {
       
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        setEmitterPosition(CGRectGetMidX(viewForLayer!.bounds), y: 0)
    }
    
    // MARK: --
    
    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        let x: CGFloat = sender.locationInView(viewForLayer).x
        let y: CGFloat = sender.locationInView(viewForLayer).y
        setEmitterPosition(x, y: y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print((touches.first?.locationInView(viewForLayer))!)
        let x: CGFloat = touches.first!.locationInView(viewForLayer).x
        let y: CGFloat = touches.first!.locationInView(viewForLayer).y
        
        setEmitterPosition(x, y: y)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
