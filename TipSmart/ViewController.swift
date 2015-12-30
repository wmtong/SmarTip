//
//  ViewController.swift
//  tips
//
//  Created by William Tong on 12/26/15.
//  Copyright © 2015 TongTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var Total1: UILabel!
    @IBOutlet weak var Total2: UILabel!
    @IBOutlet weak var Total3: UILabel!
    @IBOutlet weak var Total4: UILabel!
    @IBOutlet weak var Tip: UILabel!
    @IBOutlet weak var Settings: UIButton!
    @IBOutlet weak var TipControl: UISegmentedControl!
    
    var tip1per = 18
    var tip2per = 20
    var tip3per = 22

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        let billvalue = NSUserDefaults.standardUserDefaults().valueForKey("savebill")
        if(billvalue==nil){
            BillField.text = "$"
        }else{
            BillField.text = "\(billvalue!)"
        }
        BillField.becomeFirstResponder()
        onEditingChanged(true)
        TipControl.setTitle(String(tip1per) + "%", forSegmentAtIndex: 0)
        TipControl.setTitle(String(tip2per) + "%", forSegmentAtIndex: 1)
        TipControl.setTitle(String(tip3per) + "%", forSegmentAtIndex: 2)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [Double(tip1per)/100,Double(tip2per)/100,Double(tip3per)/100]
        let tipPercentage = tipPercentages[TipControl.selectedSegmentIndex]
        let billText: String!
        if(BillField.text=="$"){
            billText = "0.00"
        }else{
            billText = String(BillField.text!.characters.dropFirst())
        }
        let billAmount = (billText! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total1 = tip + billAmount
        let total2 = total1/2
        let total3 = total1/3
        let total4 = total1/4
        Tip.text = "$\(tip)"
        Tip.text = String(format: "$%.2f", tip)
        Total1.text = "$\(total1)"
        Total1.text = String(format: "$%.2f", total1)
        Total2.text = "$\(total2)"
        Total2.text = String(format: "$%.2f", total2)
        Total3.text = "$\(total3)"
        Total3.text = String(format: "$%.2f", total3)
        Total4.text = "$\(total3)"
        Total4.text = String(format: "$%.2f", total4)
        if(BillField.text==""){
        BillField.text = "$"
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        NSUserDefaults.standardUserDefaults().setValue(BillField.text, forKey: "savebill")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

