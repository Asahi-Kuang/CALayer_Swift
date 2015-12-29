//
//  MainViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/28.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

let identifier = "identifier"
class MainViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView?
    var dataArray: Array<AnyObject>?
    var dataSource: ArrayDataSource?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createUI()
        setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: --
    // MARK: - Methods
    func createUI() {
        navigationController!.navigationBar.barTintColor = UIColor(red: 111/255.0, green: 249/255.0, blue: 193/255.0, alpha: 1)
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleLabel.font = UIFont.boldSystemFontOfSize(20.0)
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "CALayer_Demo"
        navigationItem.titleView = titleLabel
        
        self.dataArray = ["CALayer", "CAScrollLayer", "CATextLayer", "AVPlayerLayer", "EmitterLayer", "..."]
    }
    // MARK: --

    // MARK: - set up tableView
    func setUpTableView() {
        tableView = UITableView(frame: self.view.frame, style: .Plain)
        tableView!.delegate = self
        let view = UIView()
        tableView!.tableFooterView = view
        self.view = tableView!
        
        let block : cellConfigureBlock = {
            mCell, item in
            let cell = mCell as! UITableViewCell
            let string = item as! String
            cell.textLabel!.text = string
        }
        
        dataSource = ArrayDataSource(items: self.dataArray!, reuseIdentifier: identifier, block: block, isSystemCell: true)
        
        tableView!.dataSource = dataSource
    }
    // MARK: --
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var pushVC: UIViewController?
        
        if indexPath.row < 5 {
        
        switch indexPath.row {
        case 0:
            pushVC = storyboard!.instantiateViewControllerWithIdentifier("CALayer")
        case 1:
            pushVC = storyboard!.instantiateViewControllerWithIdentifier("ScrollLayer")
        case 2:
            pushVC = storyboard!.instantiateViewControllerWithIdentifier("CATextLayer")
        case 3:
            pushVC = storyboard!.instantiateViewControllerWithIdentifier("AVPlayerLayer")
        case 4:
            pushVC = storyboard!.instantiateViewControllerWithIdentifier("CAEmitterLayer")
        default:
            break
        }
        
        navigationController!.pushViewController(pushVC!, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    // MARK: --
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
