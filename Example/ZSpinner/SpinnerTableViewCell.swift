//
//  SpinnerTableViewCell.swift
//  ZSpinner
//
//  Created by Thuong Nguyen on 9/17/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import ZSpinner

class SpinnerTableViewCell: UITableViewCell {
    
    static let cellId = "cellId"
    
    @IBOutlet weak var spinner: ZSpinner!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setType(spinnerType: Int) {
        self.spinner.spinnerType = spinnerType
    }
}
