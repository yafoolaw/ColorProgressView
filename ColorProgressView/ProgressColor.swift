//
//  ProgressColor.swift
//  ColorProgressView
//
//  Created by FrankLiu on 16/3/15.
//  Copyright © 2016年 FrankLiu. All rights reserved.
//

import UIKit

class ProgressColor: NSObject {

    var m_colors     : [AnyObject]?
    var m_startPoint : CGPoint?
    var m_endPoint   : CGPoint?
    var m_duration   : NSTimeInterval?
    
    func loopMove() -> [AnyObject] {
    
        var tempArray : Array = self.m_colors!
        
        let last = tempArray.last
        
        tempArray.removeLast()
        
        tempArray.insert(last!, atIndex: 0)
        
        return tempArray
    }
    
    override init() {
        
        super.init()
        
        self.m_startPoint = CGPoint(x: 0, y: 0.5)
        self.m_endPoint   = CGPoint(x: 1, y: 0.5)
        self.m_duration   = 0.1
        self.m_colors     = [AnyObject]()
        
        for var deg : Int = 0; deg <= 360; deg += 5 {
        
            let color = UIColor(hue: CGFloat(deg) / 360.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            
            self.m_colors!.append(color.CGColor)
        }
    }
}

extension ProgressColor {

    class func redGradientColor() -> ProgressColor {
    
        let progressColor = ProgressColor()
        
        var array = [AnyObject]()
        
        array.append(UIColor(red: 0.2, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.2, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.3, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.4, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.5, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.6, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.7, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.8, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.9, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 1,   green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.9, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.8, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.7, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.6, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.5, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.4, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.3, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.2, green: 0, blue: 0, alpha: 1).CGColor)
        array.append(UIColor(red: 0.2, green: 0, blue: 0, alpha: 1).CGColor)
        
        progressColor.m_colors = array
        
        return progressColor
    }
}
