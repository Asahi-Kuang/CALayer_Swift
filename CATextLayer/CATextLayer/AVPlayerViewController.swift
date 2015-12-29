//
//  AVPlayerViewController.swift
//  CATextLayer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/29.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit
import AVFoundation

class AVPlayerViewController: UIViewController {

    @IBOutlet var viewForLayer: UIView!
    
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet var shouldRunloopSwitch: UISwitch!
    
    @IBOutlet var progressControl: UISlider!
    
    enum Rate: Int{
        case playSlowly = 0, playNormal, playFase
    }
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    let avplayer = AVPlayerLayer()
    var player: AVPlayer {
        return avplayer.player!
    }
    
    var playRate: Float?
    var isPlaying: Bool?
    var rateBeforePause: Float = 1.0
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpAVPlayerLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpAVPlayerLayer() {
        
        avplayer.frame = viewForLayer.bounds
        l.addSublayer(avplayer)
        
        let path = NSBundle.mainBundle().URLForResource("mp", withExtension: "mp4")
        let player = AVPlayer(URL: path!)
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        avplayer.player = player
        isPlaying = false
        
        // 通知中心
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playToEndHandler:", name: "AVPlayerItemDidPlayToEndTimeNotification", object: player.currentItem)
    }

    @IBAction func playOrPause(sender: UIButton) {
        if sender.titleLabel?.text == "Play" {
            player.play()
            isPlaying = true
            sender.setTitle("Pause", forState: .Normal)
            
        }
        else {
            player.pause()
            isPlaying = false
            sender.setTitle("Play", forState: .Normal)
        }
    }
    
    func updateButtonTitle() {
        if isPlaying == true {
            playButton.setTitle("Pause", forState: .Normal)
        }
        else {
            playButton.setTitle("Play", forState: .Normal)
        }
    }
    
    @IBAction func changePlayRate(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case Rate.playSlowly.rawValue:
            playRate = 0.5
        case Rate.playNormal.rawValue:
            playRate = 1.0
        case Rate.playFase.rawValue:
            playRate = 2.0
        default:
            break
        }
        player.rate = playRate!
        rateBeforePause = playRate!
        isPlaying = true
        updateButtonTitle()
    }
    
    func play() {
        
        if playButton.titleLabel?.text == "Play" {
            if let resumeRate: Float = rateBeforePause {
                player.rate = resumeRate
                
            }else{
                player.play()
            }
            isPlaying = true
           
        }else{
            rateBeforePause = player.rate
            isPlaying = false
            player.pause()
            
        }
        
    }
    
    func playToEndHandler(notification: NSNotification) {
        let playItem = notification.object as! AVPlayerItem
        playItem.seekToTime(kCMTimeZero)
        
        if shouldRunloopSwitch.on == false {
            player.pause()
            isPlaying = false
            updateButtonTitle()
        }
    }
    
    @IBAction func shouldLoop(sender: UISwitch) {
        if sender.on == true {
            player.actionAtItemEnd = .None
        }
        else {
            player.actionAtItemEnd = .Pause
        }
    }
    
    @IBAction func chageVolume(sender: UISlider) {
        player.volume = sender.value
    }
    
    @IBAction func advaceOrGoback(sender: UISlider) {
        // 1s == 1000ms  1m = 60000ms 1h = 360000 000
        // 2h17m17s = 120*60 + 17*60 + 17 =7200+1020+17=8237s
        // 8237 * 1000 * 1000 = 8237000000
//        82.37 * 100000000
        // 最新的视频只有12s  12* 1000 * 1000 = 12000000
        let item = player.currentItem
        let v: Int64 = Int64(Double(sender.value) * 100000.0)
        let value: CMTimeValue = v
        let time = CMTime(value: value, timescale: 90000)
        item!.seekToTime(time)
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
