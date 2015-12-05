//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rahul Krishna Vasantham on 12/3/15.
//  Copyright © 2015 org.asu.codepath. All rights reserved.
//

import UIKit

var defaultTipPercentage:String = "defaultTipPercentage"

class ViewController: UIViewController {

    @IBOutlet var billAmount: UITextField!
    @IBOutlet var tipPercentSegment: UISegmentedControl!
    @IBOutlet var tiplabel: UILabel!
    @IBOutlet var onePersonShare: UILabel!
    @IBOutlet var twoPeopleShare: UILabel!
    @IBOutlet var threePeopleShare: UILabel!
    @IBOutlet var fourPeopleShare: UILabel!
    @IBOutlet var fivePeopleShare: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var tipPercentages = [0.18, 0.20, 0.22]
    // On click of the segment
    @IBAction func percentSelection(sender: AnyObject) {
        // Calcuate Tip
        calculateTipAndUpdate(generateTipPercent())
    }
    
    //On click of the reset button
    @IBAction func resetValues(sender: AnyObject) {
        
        resetTheValues()
    }
    
    @IBAction func onChange(sender: AnyObject) {
        //Calculate Tip
        calculateTipAndUpdate(generateTipPercent())
    }
    
    //GenerateTip
    func generateTipPercent() -> Double  {
        
        return tipPercentages[tipPercentSegment.selectedSegmentIndex]
    }
    
    // Calcuate the tip based on User Choice and Update the UI
    func calculateTipAndUpdate(tipPercent:Double) {
        
        if billAmount.text == "" {
            return
        }
        
        let tip: Double =  (Double(billAmount.text!)! * tipPercent)
        let totalAmount: Double = (Double(billAmount.text!))! + tip
        
        tiplabel.text = String(format: "$%.2f", tip)
        onePersonShare.text = String(format: "$%.2f", totalAmount)
        twoPeopleShare.text = String(format: "$%.2f", totalAmount/2.0)
        threePeopleShare.text = String(format: "$%.2f", totalAmount/3.0)
        fourPeopleShare.text = String(format: "$%.2f", totalAmount/4.0)
        fivePeopleShare.text = String(format: "$%.2f", totalAmount/5.0)
    }
    
    // This would reset all the values.
    func resetTheValues() {
        let defaultValue = "$0.00"
        
        billAmount.text = ""
        tiplabel.text = defaultValue
        onePersonShare.text = defaultValue
        twoPeopleShare.text = defaultValue
        threePeopleShare.text = defaultValue
        fourPeopleShare.text = defaultValue
        fivePeopleShare.text = defaultValue
        
        // ON VIEW LOAD SET THE DEFAULT SEGMENT INDEX.
        if let value:Int = defaults.integerForKey(defaultTipPercentage) {
            tipPercentSegment.selectedSegmentIndex = value
        } else {
            tipPercentSegment.selectedSegmentIndex = 0
        }
    }
    
    // End Editing on Tap.
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize the initial values
        resetTheValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

