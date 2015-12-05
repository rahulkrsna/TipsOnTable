//
//  TipPercentSettingsViewController.swift
//  TipCalculator
//
//  Created by Rahul Krishna Vasantham on 12/3/15.
//  Copyright © 2015 org.asu.codepath. All rights reserved.
//

import UIKit

class TipPercentSettingsViewController: UIViewController {

    @IBOutlet var tipPercentDefaultSegment: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // SET THE DEFUALT TIP PERCENT VALUE.
    @IBAction func tipPercentDefaultValueChange(sender: AnyObject) {
        
        defaults.setInteger(tipPercentDefaultSegment.selectedSegmentIndex, forKey: defaultTipPercentage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ON VIEW LOAD SET THE DEFAULT SEGMENT INDEX.
        if let value:Int = defaults.integerForKey(defaultTipPercentage) {
            tipPercentDefaultSegment.selectedSegmentIndex = value
        } else {
            tipPercentDefaultSegment.selectedSegmentIndex = 0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
