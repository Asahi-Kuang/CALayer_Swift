//
//  GradientLayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/1.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

import UIKit

class GradientLayerViewController: UIViewController {

    @IBOutlet var viewForLayer: UIView!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    var startX: CGFloat?
    var endX: CGFloat?
    var colors = [AnyObject]()
    let gradientLayer = CAGradientLayer()
    var locations : [Float] = [0, 1/6.0, 1/3.0]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpGradientLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpGradientLayer() {
        gradientLayer.frame = viewForLayer.bounds
        colors = [
            cgColorForRed(209.0, green: 0.0, blue: 0.0),
            cgColorForRed(255.0, green: 102.0, blue: 34.0),
            cgColorForRed(255.0, green: 218.0, blue: 33.0),
            cgColorForRed(51.0, green: 221.0, blue: 0.0),
            cgColorForRed(17.0, green: 51.0, blue: 204.0),
            cgColorForRed(34.0, green: 0.0, blue: 102.0),
            cgColorForRed(51.0, green: 0.0, blue: 68.0)]
        
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        startX = 0.0
        endX = 1.0
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: startY!)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: endY!)
        setGradientPoint(gradientLayer, startPoint: CGPoint(x: startX!, y: 0.0), endPoint: CGPoint(x: endX!, y: 1.0))
        l.addSublayer(gradientLayer)
    }
    
    func cgColorForRed(red: CGFloat, green: CGFloat, blue: CGFloat) -> AnyObject {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).CGColor as AnyObject
    }
    
    // MARK: - IBActions
    @IBAction func changeStartPoint(sender: UISlider) {
        startX = CGFloat(sender.value)
        setGradientPoint(gradientLayer, startPoint: CGPoint(x: startX!, y: 0.0), endPoint: CGPoint(x: endX!, y: 1.0))
    }
    
    @IBAction func chageEndPoint(sender: UISlider) {
        endX = CGFloat(sender.value)
        setGradientPoint(gradientLayer, startPoint: CGPoint(x: startX!, y: 0.0), endPoint: CGPoint(x: endX!, y: 1.0))
    }
    
    func setGradientPoint(gradientLayer:CAGradientLayer, startPoint:CGPoint, endPoint:CGPoint) {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
    
    @IBAction func closeOrOpenColor(sender: UISwitch) {
        switch (sender.tag) {
        case 1:
            let redColor = colors[0]
            if sender.on == true {
                colors.append(redColor)
            }
            else {
                colors.removeAtIndex(0)
            }
        case 2:
            let orangeColor = colors[1]
            if sender.on == true {
                colors.append(orangeColor)
            }else{
                colors.removeAtIndex(1)
            }
        case 3:
            let yellowColor = colors[2]
            if sender.on == true {
                colors.append(yellowColor)
            }else{
                colors.removeAtIndex(2)
            }
        default:
            break
        }
        gradientLayer.colors  = colors
    }
    
    @IBAction func chageGradientPosition(sender: UISlider) {

        switch (sender.tag) {
        case 1:
//
            locations[0] = sender.value
        case 2:

            locations[1] = sender.value

        case 3:

            locations[2] = sender.value

        default:
            break
        }

        gradientLayer.locations = locations
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
