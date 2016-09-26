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
    
    public enum SpinnerStyle : Int {
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
            print("Spinner type: ", spinnerType)
            self.spinnerLayer = getSpinnerLayer(self.spinnerType)
            self.spinnerLayer?.contentsScale = UIScreen.mainScreen().scale
            setupLayer()
        }
    }
    
    var spinnerLayer: BaseSpinnerLayer?
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        setupNotification()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNotification()
    }
    
    func setupNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ZSpinner.onGoingForeground), name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    
    func onGoingForeground() {
        animate()
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
        let color: CGColor = UIColor(red:0.95, green:0.77, blue:0.06, alpha:1.0).CGColor
        let value = SpinnerStyle.init(rawValue: rawValue)!
        switch value {
        case .Style01:
            return Style01(radius: min(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)) / 2, width: 3, color: color)
        case .Style02:
            return Style02(color: color)
        case .Style03:
            return Style03(color: color)
        case .Style04:
            return Style04(color: color)
        case .Style05:
            return Style05(color: color)
        default:
            return Style04(color: color)
        }
    }
}
