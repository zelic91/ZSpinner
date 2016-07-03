//
//  ZSpinner.swift
//  Pods
//
//  Created by Thuong Nguyen on 7/2/16.
//
//

import UIKit

@IBDesignable
public class ZSpinner: UIView {
    
    public enum SpinnerType : Int {
        case Style01 = 1
        case Style02 = 2
        case Style03 = 3
        case Style04 = 4
        case Style05 = 5
        case Style06 = 6
    }
    
    public override var hidden: Bool {
        didSet {
            
        }
    }
    
    @IBInspectable
    public var spinnerType: Int = 1 {
        didSet {
            self.spinnerLayer = getSpinnerLayer(self.spinnerType)
            setupLayer()
            
        }
    }
    
    var spinnerLayer: BaseSpinnerLayer?
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupLayer()
    }
    
    func setupLayer() {
        self.layer.sublayers?.removeAll()
        if spinnerLayer != nil {
            self.layer.addSublayer(spinnerLayer!)
        }
    }
    
    public override func layoutSublayersOfLayer(layer: CALayer) {
        spinnerLayer!.frame = self.bounds
        setNeedsDisplay()
        animate()
    }
    
    public func animate() {
        if spinnerLayer != nil {
            spinnerLayer!.animate()
        }
    }
    
    func getSpinnerLayer(raw: Int?) -> BaseSpinnerLayer? {
        guard let rawValue = raw else {
            return nil
        }
        let value = SpinnerType.init(rawValue: rawValue)!
        switch value {
        case .Style01:
            return Style01(radius: min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) / 2, width: 3, color: UIColor.purpleColor().CGColor)
        default:
            return Style01(radius: min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) / 2, width: 3, color: UIColor.purpleColor().CGColor)
        }
    }
}
