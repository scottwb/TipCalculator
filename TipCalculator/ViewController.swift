//
//  ViewController.swift
//  TipCalculator
//
//  Created by Scott W. Bradley on 1/3/15.
//  Copyright (c) 2015 Scott W. Bradley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var percentages = Array(possibleTips.keys)
        sort(&percentages)

        var results = ""
        for tipPct in percentages {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format: "%.2f", tipValue)
            results += "\(tipPct)%: \(prettyTipValue)\n"
        }
        resultsTextView.text = results
    }

    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.00
        refreshUI()
    }

    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }

    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
}

