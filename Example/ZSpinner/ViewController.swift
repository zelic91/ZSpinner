//
//  ViewController.swift
//  ZSpinner
//
//  Created by Thuong Nguyen on 07/02/2016.
//  Copyright (c) 2016 Thuong Nguyen. All rights reserved.
//

import UIKit
import ZSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SpinnerTableViewCell.cellId) as! SpinnerTableViewCell
        cell.setType(indexPath.row + 1)
        return cell
    }
}

