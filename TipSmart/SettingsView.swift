//
//  SettingsView.swift
//  TipSmart
//
//  Created by William Tong on 12/30/15.
//  Copyright © 2015 TongTech. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {
    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
    @IBOutlet weak var Tip3: UITextField!
 
    var tip1def = "18"
    var tip2def = "20"
    var tip3def = "22"

    
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
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
            let svc = segue!.destinationViewController as! ViewController;
            svc.tip1per = (tip1def as NSString).integerValue
            svc.tip2per = (tip2def as NSString).integerValue
            svc.tip3per = (tip3def as NSString).integerValue
    }
}
