//
//  ViewController.swift
//  ColorProgressView
//
//  Created by FrankLiu on 16/3/15.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.size.width

class ViewController: UIViewController {
    
    var m_timer   : GCDTimer?
    var m_counter : Int = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        // 红色进度条
        let redProgressView = ColorProgressView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 1))
        
        redProgressView.m_color = ProgressColor.redGradientColor()
        redProgressView.center  = self.view.middlePoint
        redProgressView.y      -= 20
        redProgressView.startAnimation()
        self.view.addSubview(redProgressView)
        
        // 彩色进度条
        let colorProgressView = ColorProgressView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 5))
        
        colorProgressView.center = self.view.middlePoint
        colorProgressView.y     += 20
        colorProgressView.startAnimation()
        self.view.addSubview(colorProgressView)
        
        // 定时器
        self.m_timer = GCDTimer(inQueue: GCDQueue.mainQueue())
        
        // 关于闭包内,内存管理的问题,参见http://swifter.tips/retain-cycle/
        self.m_timer!.event({ () -> Void in
            
            UIView.animateWithDuration(0.5, delay: 0,
                           usingSpringWithDamping: 2,
                            initialSpringVelocity: 0,
                                          options: .CurveLinear,
                                       animations: { [unowned self]() -> Void in
                
                                        if self.m_counter == 100 {
                                            
                                            self.m_counter = 0
                                            
                                        } else {
                                            
                                            self.m_counter += 10
                                        }
                                        
                                        redProgressView.m_progress   = Float(self.m_counter) / 100.0
                                        colorProgressView.m_progress = Float(self.m_counter) / 100.0
                
                }, completion: nil)
            
            }, timeIntervalWithSecs: 1.0, delaySecs: 1.0)
        
        self.m_timer!.start()
    }
}

