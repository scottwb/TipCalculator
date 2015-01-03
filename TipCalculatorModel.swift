//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Scott W. Bradley on 1/3/15.
//  Copyright (c) 2015 Scott W. Bradley. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }

    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }

    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }

    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        let possibleTips = [0.15, 0.18, 0.20]
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}