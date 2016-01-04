//
//  CATiledLayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/2.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

import UIKit

class CATiledLayerViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewForLayer: TiledLayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.bounces = false
        scrollView.decelerationRate = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
