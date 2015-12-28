//
//  CALayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class CALayerViewController: UIViewController {

    @IBOutlet var viewForLayer: UIView!
    @IBOutlet var crLabel: UILabel!
    @IBOutlet var bwLabel: UILabel!

    
    var l: CALayer {
        return viewForLayer.layer
    }
    // properties:
    var r: CGFloat?
    var g: CGFloat?
    var b: CGFloat?
    
    var borderWidth: CGFloat?
    
    var needMaskToBounds: Bool?
    
    var cornerRadiusDegree: CGFloat?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()

        setUpLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    func setUpLayer() {
        l.contents = UIImage(named: "star.jpg")?.CGImage
        l.contentsGravity = kCAGravityResize
        
        r = 100; g = 50; b = 80
        l.borderColor = UIColor(red: r!/255.0, green: g!/255.0, blue: b!/255.0, alpha: 1.0).CGColor
        borderWidth = 20
        l.borderWidth = borderWidth!
        
        needMaskToBounds = true
        l.masksToBounds = needMaskToBounds!
        
        cornerRadiusDegree = 0.0
        l.cornerRadius = cornerRadiusDegree!
    }
    
    
    @IBAction func chageRGBValue(sender: UISlider) {
        switch sender.tag {
        case 1:
            r = CGFloat(sender.value)
        case 2:
            g = CGFloat(sender.value)
        case 3:
            b = CGFloat(sender.value)
        default:
            break
        }
        l.borderColor = UIColor(red: r!/255.0, green: g!/255.0, blue: b!/255.0, alpha: 1.0).CGColor
    }
    

    @IBAction func changeCornerRadius(sender: UISlider) {
        cornerRadiusDegree = CGFloat(sender.value)
        l.cornerRadius = cornerRadiusDegree!
        crLabel.text = "Corner Radius: \(sender.value)"
    }
    
    @IBAction func changeBorderWidth(sender: UISlider) {
        
        borderWidth = CGFloat(sender.value)
        l.borderWidth = borderWidth!
        bwLabel.text = "Border Width: \(sender.value)"
    }
    
    @IBAction func openShadowEffect(sender: UISwitch) {
        if sender.on == true {
            setShadow(l)
        }
        else {
            l.masksToBounds = true
        }
    }
    
    func setShadow(layer: CALayer) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGrayColor().CGColor
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
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
