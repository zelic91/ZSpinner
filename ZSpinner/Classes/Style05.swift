//
//  Style05.swift
//  Pods
//
//  Created by Thuong Nguyen on 9/18/16.
//
//

import UIKit

class Style05: BaseSpinnerLayer {
    init(color: CGColor) {
        super.init()
        self.color01  = color
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        let width = bounds.width
        let height = bounds.height
        let radius: CGFloat = 10.0
        let padding: CGFloat = 5
        let leading: CGFloat = (width - 3 * (2 * radius) - 2 * padding)/2
        self.position01 = CGPoint(x: leading + radius, y: height/2)
        self.position02 = CGPoint(x: leading + 3 * radius + padding, y: height/2)
        self.position03 = CGPoint(x: leading + 5 * radius + 2 * padding, y: height/2)
        
        CGContextSetFillColorWithColor(ctx, color01)
//        CGContextSetAlpha(ctx, alpha01)
        let path: CGPath = UIBezierPath(arcCenter: position01, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path)
        CGContextDrawPath(ctx, .Fill)
        
        CGContextSetFillColorWithColor(ctx, color01)
        CGContextSetAlpha(ctx, alpha02)
        let path2: CGPath = UIBezierPath(arcCenter: position02, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path2)
        CGContextDrawPath(ctx, .Fill)
        
        CGContextSetFillColorWithColor(ctx, color01)
        CGContextSetAlpha(ctx, alpha03)
        let path3: CGPath = UIBezierPath(arcCenter: position03, radius: radius, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true).CGPath
        CGContextAddPath(ctx, path3)
        CGContextDrawPath(ctx, .Fill)
    }
    
    override func buildAnimation() -> CAAnimation? {
        let anim6 = CABasicAnimation(keyPath: "alpha01")
        anim6.beginTime = 0.5
        anim6.fromValue = 1
        anim6.toValue = 0.5
        anim6.duration = 0.5
        anim6.fillMode = kCAFillModeForwards
        
        let animGroup = CAAnimationGroup()
        animGroup.animations  = [anim6]
        animGroup.duration    = 1
        animGroup.repeatCount = Float(INT_MAX)
        
        return animGroup
    }

}
