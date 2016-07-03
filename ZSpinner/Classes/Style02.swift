//
//  Style02.swift
//  Pods
//
//  Created by Thuong Nguyen on 7/3/16.
//
//

import UIKit

class Style02: BaseSpinnerLayer {
    
    init(color: CGColor) {
        super.init()
        self.color01  = color
        self.color02  = color
        self.color03  = color
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        let center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        CGContextSetFillColorWithColor(ctx, color02)
        CGContextSetAlpha(ctx, alpha01)
        let path: CGPath = UIBezierPath(arcCenter: center, radius: radius01, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path)
        CGContextDrawPath(ctx, .Fill)
        
        CGContextSetFillColorWithColor(ctx, color03)
        CGContextSetAlpha(ctx, alpha02)
        let path2: CGPath = UIBezierPath(arcCenter: center, radius: radius02, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path2)
        CGContextDrawPath(ctx, .Fill)
    }
    
    override func buildAnimation() -> CAAnimation? {
        let radius = min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let anim = CABasicAnimation(keyPath: "radius01")
        anim.fromValue = 0
        anim.duration = 1
        anim.repeatCount = Float(INT_MAX)
        anim.toValue = radius
        anim.toValue = radius
        
        let anim2 = CABasicAnimation(keyPath: "radius02")
        anim2.beginTime = 0.5
        anim2.duration = 1
        anim2.repeatCount = Float(INT_MAX)
        anim2.fromValue = 0
        anim2.toValue = radius
        anim2.toValue = radius
        
        let anim3 = CABasicAnimation(keyPath: "alpha01")
        anim3.repeatCount = Float(INT_MAX)
        anim3.fromValue = 1
        anim3.duration = 1
        anim3.toValue = 0
        
        let anim4 = CABasicAnimation(keyPath: "alpha02")
        anim4.repeatCount = Float(INT_MAX)
        anim4.beginTime = 0.5
        anim4.fromValue = 1
        anim4.duration = 1
        anim4.toValue = 0
        
        let animGroup = CAAnimationGroup()
        animGroup.animations  = [anim, anim2, anim3, anim4]
        animGroup.duration    = Double(INT_MAX)
        animGroup.repeatCount = Float(INT_MAX)
        
        return animGroup
    }
}
