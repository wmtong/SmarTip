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
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var TipControl: UISegmentedControl!
    var tipTotal: Double?
    var formatString : String!
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
    @IBOutlet weak var Tip3: UITextField!
    
    var tip1def = "18"
    var tip2def = "20"
    var tip3def = "22"
    
    var tip1per: Double = 18
    var tip2per: Double = 20
    var tip3per: Double = 22

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatString = formatter.locale.objectForKey(NSLocaleCurrencySymbol) as! String
        let billvalue = NSUserDefaults.standardUserDefaults().valueForKey("savebill")
        if(billvalue==nil){
            BillField.text = "\(formatString)"
        }else{
            BillField.text = "\(formatString)" + "\(billvalue!)"
        }
        BillField.becomeFirstResponder()
        
        setTipControl()
        onEditingChanged(true)
        
        settingsView.layer.cornerRadius = 8.0
        settingsView.clipsToBounds = true
    }
    
    func setTipControl(){
        TipControl.setTitle(String(tip1per) + "%", forSegmentAtIndex: 0)
        TipControl.setTitle(String(tip2per) + "%", forSegmentAtIndex: 1)
        TipControl.setTitle(String(tip3per) + "%", forSegmentAtIndex: 2)
    }
    
    //animation controls
    
    @IBAction func settingsViewOpen(sender: AnyObject) {
        if(settingsView.alpha==0.0){
            fadeIn()
        }else{
            fadeOut()
            setTipControl()
        }
    }
    
    func fadeIn(duration duration: NSTimeInterval = 0.6) {
        UIView.animateWithDuration(duration, animations: {
            self.settingsView.alpha = 1.0
        })
        print("fade in")
    }

    func fadeOut(duration duration: NSTimeInterval = 0.6) {
        UIView.animateWithDuration(duration, animations: {
            self.settingsView.alpha = 0.0
        })
    }
    
    //changes tip values
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [Double(tip1per)/100,Double(tip2per)/100,Double(tip3per)/100]
        let tipPercentage = tipPercentages[TipControl.selectedSegmentIndex]
        let billText: String!
        if(BillField.text=="\(formatString)"){
            billText = "0.00"
        }else{
            billText = String(BillField.text!.characters.dropFirst())
        }
        let billAmount = (billText! as NSString).doubleValue
        tipTotal = billAmount
        let tip = billAmount * tipPercentage
        let total1 = tip + billAmount
        let total2 = total1/2
        let total3 = total1/3
        let total4 = total1/4
        Tip.text = "\(formatString)" + String(format: "%.2f", tip)
        Total1.text = "\(formatString)" + String(format: "%.2f", total1)
        Total2.text = "\(formatString)" + String(format: "%.2f", total2)
        Total3.text = "\(formatString)" + String(format: "%.2f", total3)
        Total4.text = "\(formatString)" + String(format: "%.2f", total4)
        if(BillField.text==""){
        BillField.text = "\(formatString)"
        }
    }
    
    //gesture to close keyboard
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        if(settingsView.alpha==0){
            let saveValue = String(BillField.text!.characters.dropFirst())
            print(saveValue)
            NSUserDefaults.standardUserDefaults().setValue(saveValue, forKey: "savebill")
        }else{
            tip1per = (NSNumberFormatter().numberFromString(tip1def)?.doubleValue)!
            tip2per = (NSNumberFormatter().numberFromString(tip2def)?.doubleValue)!
            tip3per = (NSNumberFormatter().numberFromString(tip3def)?.doubleValue)!
        }
    }
    
    
    //methods for settings view
    
    @IBAction func changeTip1(sender: AnyObject) {
        Tip1.text = ""
    }
    
    @IBAction func endTip1(sender: AnyObject) {
        if((Tip1.text! as NSString).intValue>100||Tip1.text==""){
            Tip1.text = String(tip1def + "%")
        }
        else{
            tip1def = Tip1.text!
            Tip1.text = String(Tip1.text! + "%")
        }
    }
    
    @IBAction func changeTip2(sender: AnyObject) {
        Tip2.text = ""
    }
    
    @IBAction func endTip2(sender: AnyObject) {
        if((Tip2.text! as NSString).intValue>100||Tip2.text==""){
            Tip2.text = String(tip2def + "%")
        }
        else{
            tip2def = Tip2.text!
            Tip2.text = String(Tip2.text! + "%")
        }
    }
    
    @IBAction func changeTip3(sender: AnyObject) {
        Tip3.text = ""
    }
    
    @IBAction func endTip3(sender: AnyObject) {
        if((Tip3.text! as NSString).intValue>100||Tip3.text==""){
            Tip3.text = String(tip3def + "%")
        }
        else{
            tip3def = Tip3.text!
            Tip3.text = String(Tip3.text! + "%")
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

