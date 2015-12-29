//
//  ViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForTextLayer: UIView!
    @IBOutlet weak var changeFontSize: UISlider!
    @IBOutlet weak var chageViewWidth: UISlider!
    
    var l: CALayer {
        return viewForTextLayer.layer
    }
    
    var textLayer: CATextLayer?
    var fontSize: CGFloat?
    var truncationMode: String?
    var fName: String?
    var align: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        setUpLayer()
        
//        print(UIFont.familyNames())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpLayer() {
        textLayer = CATextLayer()
        textLayer!.frame = viewForTextLayer.bounds
        l.addSublayer(textLayer!)
//        l.masksToBounds = true
        let str = "1、Stray birds of summer come to my window to sing and fly away.And yellow leaves of autumn, which have no songs, flutter and fall there with a sigh.夏天的飞鸟，飞到我窗前唱歌，又飞去了。秋天的黄叶，他们没有什么可唱的，只是叹息一声，飞落在那里。\n2、It is the tears of the earth that keep her smiles in bloom.使大地保持着青春不谢的，是大地的热泪。\n3、The mighty desert is burning for the love of a blade of grasswho shakes her head and laughs and flies away.伟大的沙漠为了绿叶的爱而燃烧，而她摇摇头、笑着、飞走了。\n4、If you shed tears when you miss the sun, you also miss the stars.如果你因错过太阳而流泪，那么你也将错过群星。\n5、The sands in you way beg for your song and your movement,dancing water.Will you carry the burden of their lameness?跳着舞的流水啊！当你途中的泥沙为你的歌声和流动哀求时，你可愿意担起他们跛足的重担？"
        
        textLayer!.string = str
        fName = "Noteworthy-Light"
        let fontName : CFStringRef = fName!
        textLayer!.font = CTFontCreateWithName(fontName, 24, nil)
        fontSize = 20
        textLayer!.fontSize = fontSize!
        textLayer!.foregroundColor = UIColor(red: 2/255.0, green: 130/255.0, blue: 85/255.0, alpha: 1).CGColor
        align = kCAAlignmentLeft
        textLayer!.alignmentMode = align!
        textLayer!.contentsScale = UIScreen.mainScreen().scale
        textLayer!.wrapped = true
        truncationMode = kCATruncationStart
        textLayer!.truncationMode = truncationMode!
        
    }
    
    @IBAction func chageFontSize(sender: UISlider) {
        fontSize = CGFloat(sender.value)
        textLayer!.fontSize = fontSize!
    }
    
    @IBAction func changeTruncationMode(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch (index){
        case 0:
            truncationMode = kCATruncationStart
            break
        case 1:
            truncationMode = kCATruncationMiddle
            break
        case 2:
            truncationMode = kCATruncationEnd
            break
        case 3:
            truncationMode = kCATruncationNone
            break
        default:
            break
        }
        textLayer!.truncationMode = truncationMode!
    }

    @IBAction func chageFont(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            fName = "Noteworthy-Light"
        case 1:
            fName = "Helvetica"
        case 2:
            fName = "Futura-Medium"
        case 3:
            fName = "IowanOldStyle-Roman"
        case 4:
            fName = "Optima-Regular"
        case 5:
            fName = "Papyrus"
        default:
            break
        }
        textLayer!.font = fName
    }
    
    @IBAction func chageAlignment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            align = kCAAlignmentLeft
        case 1:
            align = kCAAlignmentCenter
        case 2:
            align = kCAAlignmentRight
        case 3:
            align = kCAAlignmentNatural
        case 4:
            align = kCAAlignmentJustified
        default:
            break
        }
        textLayer!.alignmentMode = align!
    }
    
    @IBAction func adjustLightDegree(sender: UISlider) {
        textLayer!.opacity = sender.value
    }
}

