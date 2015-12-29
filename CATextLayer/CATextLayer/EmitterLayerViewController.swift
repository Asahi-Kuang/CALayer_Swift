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
        emitterLayer.backgroundColor = UIColor.whiteColor().CGColor
//        emitterLayer.masksToBounds = true
        emitterLayer.renderMode = kCAEmitterLayerCircle
        emitterLayer.seed = UInt32(NSDate().timeIntervalSince1970)
        emitterLayer.drawsAsynchronously = true
        
        emitterLayer.emitterCells = [emitterCell]
        l.addSublayer(emitterLayer)
        
        setEmitterPosition(CGRectGetMidX(viewForLayer!.bounds), y: 0)
        setEmitterCell()
    }
    
    func setEmitterCell() {
        emitterCell.contents = UIImage(named: "smallStar")?.CGImage
        emitterCell.velocity = 20.0
        emitterCell.velocityRange = 500.0
        
        emitterCell.color = UIColor.redColor().CGColor
        emitterCell.scale = 1.0
        emitterCell.redRange = 0.2
        emitterCell.greenRange = 0.5
        emitterCell.blueRange = 0.4
        emitterCell.alphaRange = -0.5
        emitterCell.redSpeed = 0.5
        emitterCell.greenSpeed = 0.5
        emitterCell.blueSpeed = 0.5
        emitterCell.alphaSpeed = -0.5
        
        let zeroDegreesInRadians = degressToRadians(0.0)
        emitterCell.spin = degressToRadians(360.0)
        emitterCell.spinRange = zeroDegreesInRadians
        emitterCell.emissionRange = degressToRadians(360.0)
        
        emitterCell.lifetime = 5.0
        emitterCell.birthRate = 50.0
        emitterCell.xAcceleration = 0.0
        emitterCell.yAcceleration = 500.0
        
    }
    
    func degressToRadians(degrees: Double) -> CGFloat {
        return CGFloat(degrees * M_PI / 360.0)
    }
    
    func setEmitterPosition(x: CGFloat, y: CGFloat) {
       
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        setEmitterPosition(CGRectGetMidX(viewForLayer!.bounds), y: 0)
    }
    
    // MARK: --

    @IBAction func tapGes(sender: UITapGestureRecognizer) {
//        var touches = UITouch()
//        var point = touches.locationInView(view)
//        print(point)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(touches.first?.locationInView(viewForLayer))
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
