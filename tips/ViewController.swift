//
//  ViewController.swift
//  tips
//
//  Created by David Thomsen on 4/12/15.
//  Copyright (c) 2015 David Thomsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoLabel.text = "$0.00"
        threeLabel.text = "$0.00"
        fourLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var two = total / 2
        var three = total / 3
        var four = total / 4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", two)
        threeLabel.text = String(format: "$%.2f", three)
        fourLabel.text = String(format: "$%.2f", four)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

