//
//  Style03.swift
//  Pods
//
//  Created by Thuong Nguyen on 7/5/16.
//
//

import UIKit

class Style03: BaseSpinnerLayer {
    
    init(color: CGColor) {
        super.init()
        self.radius01 = 28
        self.radius02 = 8
        self.color01  = color
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        CGContextSetFillColorWithColor(ctx, color01)
        let path: CGPath = UIBezierPath(arcCenter: position01, radius: radius01, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path)
        CGContextDrawPath(ctx, .Fill)
        
        CGContextSetFillColorWithColor(ctx, color01)
        let path2: CGPath = UIBezierPath(arcCenter: position02, radius: radius02, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path2)
        CGContextDrawPath(ctx, .Fill)
    }
    
    override func buildAnimation() -> CAAnimation? {
        let radius = min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        let center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        
        let anim = CAKeyframeAnimation(keyPath: "position01")
        let path: CGPath = UIBezierPath(arcCenter: center, radius: radius - radius01, startAngle: -CGFloat(M_PI_2), endAngle: 3/2 * CGFloat(M_PI), clockwise: true).CGPath
        anim.path = path
        anim.duration = 1
        anim.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        anim.fillMode = kCAFillModeBoth
        anim.removedOnCompletion = false
        anim.calculationMode = kCAAnimationPaced
        
        let anim2 = CAKeyframeAnimation(keyPath: "position02")
        let path2: CGPath = UIBezierPath(arcCenter: center, radius: radius - radius01, startAngle: CGFloat(M_PI_2), endAngle: 5/2 * CGFloat(M_PI), clockwise: true).CGPath
        anim2.path = path2
        anim2.duration = 1
        anim2.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        anim2.fillMode = kCAFillModeBoth
        anim2.removedOnCompletion = false
        anim2.calculationMode = kCAAnimationPaced
        
        let anim3 = CABasicAnimation(keyPath: "radius01")
        anim3.fromValue = 28
        anim3.toValue = 8
        anim3.duration = 0.5
        anim3.fillMode = kCAFillModeForwards
        
        let anim4 = CABasicAnimation(keyPath: "radius02")
        anim4.fromValue = 8
        anim4.toValue = 28
        anim4.duration = 0.5
        anim4.fillMode = kCAFillModeForwards
        
        let anim5 = CABasicAnimation(keyPath: "radius01")
        anim5.beginTime = 0.5
        anim5.fromValue = 8
        anim5.toValue = 28
        anim5.duration = 0.5
        anim5.fillMode = kCAFillModeForwards
        
        let anim6 = CABasicAnimation(keyPath: "radius02")
        anim6.beginTime = 0.5
        anim6.fromValue = 28
        anim6.toValue = 8
        anim6.duration = 0.5
        anim6.fillMode = kCAFillModeForwards
        
        let animGroup = CAAnimationGroup()
        animGroup.animations  = [anim, anim2, anim3, anim4, anim5, anim6]
        animGroup.duration    = 1
        animGroup.repeatCount = Float(INT_MAX)
        
        return animGroup
    }

}
