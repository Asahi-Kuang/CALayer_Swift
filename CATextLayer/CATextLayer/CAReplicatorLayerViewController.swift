//
//  CAReplicatorLayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/2.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

import UIKit

class CAReplicatorLayerViewController: UIViewController {

    @IBOutlet var viewForLayer: UIView!
    
    var l:CALayer {
        return viewForLayer.layer
    }
    var replicatorLayer = CAReplicatorLayer()
    var instanceLayer = CALayer()
    var midX = CGFloat()
    var instanceLayerWidth: CGFloat = 3.0
    var instanceLayerHeight: CGFloat = 15.0
    var instanceLayerAngle: Float = Float(M_PI * 2) / 20.0
    var instanceLayerCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpReplicatorLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpReplicatorLayer() {
        
        replicatorLayer.frame = viewForLayer.bounds

        replicatorLayer.instanceCount = instanceLayerCount
        replicatorLayer.instanceColor = UIColor.whiteColor().CGColor
        replicatorLayer.instanceDelay = CFTimeInterval(1 / Float(instanceLayerCount))
        
        replicatorLayer.instanceRedOffset = 0.0
        replicatorLayer.instanceGreenOffset = -0.5
        replicatorLayer.instanceBlueOffset = -0.5
        replicatorLayer.instanceAlphaOffset = 0.0
        
        setUpAngle(replicatorLayer)
        l.addSublayer(replicatorLayer)
        
        // instance layer
//        let instanceLayer = CALayer()
        setUpInstanceLayer(replicatorLayer)
        
        setUpAnimation(instanceLayer)
    }
    
    func setUpAngle(replicatorLayer: CAReplicatorLayer) {
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(instanceLayerAngle), 0.0, 0.0, 1.0)
    }
    
    func setUpInstanceLayer(replicatorLayer:CAReplicatorLayer) {
        instanceLayer.backgroundColor = UIColor.redColor().CGColor

        midX = CGRectGetMidX(viewForLayer.bounds) - instanceLayerWidth / 2.0
        instanceLayer.frame = CGRect(x: midX, y: viewForLayer!.bounds.size.height, width: instanceLayerWidth, height: instanceLayerHeight)
        replicatorLayer.addSublayer(instanceLayer)
    }
    
    func setUpAnimation(layer: CALayer) {
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue   = 0.0
        fadeAnimation.duration = 1.0
        fadeAnimation.repeatCount = Float(Int.max)
        
        layer.opacity = 0.0
        layer.addAnimation(fadeAnimation, forKey: "FadeAnimation")
    }

    @IBAction func changeProperty(sender: UISlider) {
        switch sender.tag {
        case 1:
            instanceLayerWidth = CGFloat(sender.value)
            instanceLayer.frame = CGRect(x: midX, y:  viewForLayer!.bounds.size.height - instanceLayerHeight*2, width: instanceLayerWidth, height: instanceLayerHeight)
        case 2:
            instanceLayerHeight = CGFloat(sender.value)
            instanceLayer.frame = CGRect(x: midX, y:  viewForLayer!.bounds.size.height - instanceLayerHeight*2, width: instanceLayerWidth, height: instanceLayerHeight)
        case 3:
            instanceLayerCount = Int(sender.value)
            instanceLayerAngle = Float(M_PI * 2) / Float(instanceLayerCount)
            setUpReplicatorLayer()
            setUpAngle(replicatorLayer)
//        case 4:
//            instanceLayerAngle = sender.value / Float(instanceLayerCount)
//            setUpAngle(replicatorLayer)
        default:
            break
        }
        
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
