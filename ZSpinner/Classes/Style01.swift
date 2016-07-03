//
//  Style01.swift
//  Pods
//
//  Created by Thuong Nguyen on 7/3/16.
//
//

import UIKit

class Style01: BaseSpinnerLayer {
    
    init(radius: CGFloat, width: CGFloat, color: CGColor) {
        super.init()
        self.radius01 = radius
        self.width01  = width
        self.color01  = color
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        CGContextSetStrokeColorWithColor(ctx, color01)
        CGContextSetLineWidth(ctx, width01)
        CGContextSetLineCap(ctx, .Round)
        let center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let path: CGPath = UIBezierPath(arcCenter: center, radius: radius01 - 3, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        CGContextAddPath(ctx, path)
        CGContextDrawPath(ctx, .Stroke)
    }
    
    override func buildAnimation() -> CAAnimation? {
        let anim = CABasicAnimation(keyPath: "radius01")
        anim.fromValue = 5
        anim.toValue = 20
        anim.autoreverses = true
        
        let anim2 = CABasicAnimation(keyPath: "color01")
        anim2.fromValue = UIColor.blackColor().CGColor
        anim2.toValue = UIColor.blueColor().CGColor
        anim2.autoreverses = true
        
        let anim3 = CABasicAnimation(keyPath: "startAngle")
        anim3.fromValue = -M_PI_2
        anim3.duration = 1
        anim3.autoreverses = false
        anim3.fillMode = kCAFillModeForwards
        anim3.toValue = 2 * M_PI - M_PI_2
        
        let anim4 = CABasicAnimation(keyPath: "startAngle")
        anim4.fromValue = 2 * M_PI - M_PI_2
        anim4.beginTime = 1
        anim4.duration = 0.5
        anim4.autoreverses = false
        anim4.fillMode = kCAFillModeForwards
        anim4.toValue = 4 * M_PI - M_PI_2
        
        let anim5 = CABasicAnimation(keyPath: "endAngle")
        anim5.fromValue = -M_PI_2
        anim5.duration = 0.5
        anim5.autoreverses = false
        anim5.fillMode = kCAFillModeForwards
        anim5.toValue = 2 * M_PI - M_PI_2
        
        let anim6 = CABasicAnimation(keyPath: "endAngle")
        anim6.fromValue = 2 * M_PI - M_PI_2
        anim6.beginTime = 0.5
        anim6.duration = 1
        anim6.autoreverses = false
        anim6.fillMode = kCAFillModeForwards
        anim6.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        anim6.toValue = 4 * M_PI - M_PI_2
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [anim3, anim4, anim5, anim6]
        animGroup.duration = 1.5
        animGroup.repeatCount = Float(INT_MAX)
        
        return animGroup
    }
}
