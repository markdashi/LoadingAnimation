//
//  catergory.swift
//  beizerPath
//
//  Created by apple on 27/6/16.
//  Copyright © 2016年 mark. All rights reserved.
//

import UIKit

class catergory: CABasicAnimation {

    
   class func opacityForever_Animation(time : NSTimeInterval) -> CABasicAnimation {
        
        
        let animation = CABasicAnimation(keyPath:"opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = time
        animation.autoreverses = true
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)

        return animation
    }
    
    
}
