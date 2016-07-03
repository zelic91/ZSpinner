//
//  BaseSpinnerLayer.swift
//  Pods
//
//  Created by Thuong Nguyen on 7/3/16.
//
//

import UIKit

class BaseSpinnerLayer: CALayer {
    var speed01: CGFloat  = 0
    var speed02: CGFloat  = 0
    var speed03: CGFloat  = 0
    var radius01: CGFloat = 0
    var radius02: CGFloat = 0
    var radius03: CGFloat = 0
    var width01: CGFloat  = 0
    var width02: CGFloat  = 0
    var width03: CGFloat  = 0
    var color01: CGColor?
    var color02: CGColor?
    var color03: CGColor?
    var color04: CGColor?
    var color05: CGColor?
    var color06: CGColor?
    
    // Internal
    var startAngle: CGFloat = 0
    var endAngle: CGFloat   = 0
    
    
    override init() {
        super.init()
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        let spinnerLayer = layer as! BaseSpinnerLayer
        self.speed01  = spinnerLayer.speed01
        self.speed02  = spinnerLayer.speed02
        self.speed03  = spinnerLayer.speed03
        self.radius01 = spinnerLayer.radius01
        self.radius02 = spinnerLayer.radius02
        self.radius03 = spinnerLayer.radius03
        self.width01  = spinnerLayer.width01
        self.width02  = spinnerLayer.width02
        self.width03  = spinnerLayer.width03
        self.color01  = spinnerLayer.color01
        self.color02  = spinnerLayer.color02
        self.color03  = spinnerLayer.color03
        self.color04  = spinnerLayer.color04
        self.color05  = spinnerLayer.color05
        self.color06  = spinnerLayer.color06
    }
    
    init(speed01: CGFloat, speed02: CGFloat, speed03: CGFloat,
         radius01: CGFloat, radius02: CGFloat, radius03: CGFloat,
         width01: CGFloat, width02: CGFloat, width03: CGFloat,
         color01: CGColor?, color02: CGColor?, color03: CGColor?,
         color04: CGColor?, color05: CGColor?, color06: CGColor?) {
        super.init()
        self.speed01  = speed01
        self.speed02  = speed02
        self.speed03  = speed03
        self.radius01 = radius01
        self.radius02 = radius02
        self.radius03 = radius03
        self.width01  = width01
        self.width02  = width02
        self.width03  = width03
        self.color01  = color01
        self.color02  = color02
        self.color03  = color03
        self.color04  = color04
        self.color05  = color05
        self.color06  = color06
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildAnimation() -> CAAnimation? { return nil }
    
    func animate() {
        if let animation = buildAnimation() {
            self.addAnimation(animation, forKey: "animation")
        }
    }
    
    public override class func needsDisplayForKey(key: String) -> Bool {
        let keys = ["speed01", "speed02", "speed03", "radius01", "radius02", "radius03", "width01",
                    "width02", "width03", "color01", "color02", "color03", "color04", "color05",
                    "color06", "startAngle", "endAngle"]
        if keys.contains(key) {
            return true
        }
        return false
    }
}
