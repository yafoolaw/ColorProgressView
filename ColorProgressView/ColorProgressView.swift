//
//  ColorProgressView.swift
//  ColorProgressView
//
//  Created by FrankLiu on 16/3/15.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

import UIKit

class ColorProgressView: UIView {

    // MARK: -外部变量
    var m_progress : Float? {
    
        willSet {
        
            if newValue <= 0 {
            
                m_baseView?.frame = CGRect(x: 0, y: 0, width: 0, height: m_height!)
                
            } else if newValue <= 1 {
            
               m_baseView?.frame = CGRect(x: 0, y: 0, width: CGFloat(newValue!) * m_width!, height: m_height!)
                
            } else {
            
                m_baseView?.frame = CGRect(x: 0, y: 0, width: m_width!, height: m_height!)
            }
        }
    }
    var m_color    : ProgressColor?
    
    
    // MARK: -内部变量
    private
    var m_width         : CGFloat?
    
    private
    var m_height        : CGFloat?
    
    private
    var m_baseView      : UIView?
    
    private
    var m_gradientLayer : CAGradientLayer?
    
    private
    let m_timer = GCDTimer(inQueue: GCDQueue.mainQueue())
    
    // 开始进度
    func startProgress() {
    
        self.m_gradientLayer?.colors     = self.m_color?.m_colors
        self.m_gradientLayer?.startPoint = (self.m_color?.m_startPoint)!
        self.m_gradientLayer?.endPoint   = (self.m_color?.m_endPoint)!
        
        self.m_timer.event({ () -> Void in
            
            self.doProgress()
            
            }, timeIntervalWithSecs: Float((self.m_color?.m_duration)!))
        
        self.m_timer.start()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.m_width  = frame.size.width
        self.m_height = frame.size.height
        
        // Base View
        self.m_baseView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.m_height!))
        
        self.m_baseView?.layer.masksToBounds = true
        
        self.addSubview(self.m_baseView!)
        
        // CAGradientLayer
        self.m_gradientLayer = CAGradientLayer()
        
        self.m_gradientLayer?.frame = self.bounds
        
        self.m_baseView?.layer.addSublayer(self.m_gradientLayer!)
        
        // ProgressColor
        self.m_color = ProgressColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 颜色移动
    func doProgress() {

        self.m_color?.m_colors   = self.m_color?.loopMove()
    
        self.m_gradientLayer?.colors = self.m_color?.m_colors
    }

}
