//
//  ViewController.swift
//  DatePicker
//
//  Created by Naren Bhamla on 3/26/19.
//  Copyright © 2019 com.silverlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    @IBOutlet weak var labtext: UILabel!
    
    var labinput:String = "Error"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateformet()
//         verifyAge()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func dateChangeClicked(_ sender: Any) {
            // dateformet()
             verifyAge()
       // print("Date Selected via UIDatePicker value change== ", dateFormatter.string(from:dobDatePicker.date))
    }
    
    func dateformet()  {
        self.dobDatePicker.datePickerMode = .date  // = NSDate.init(timeIntervalSinceNow: 0) as Date
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print(dateFormatter.string(from: dobDatePicker.date))
         self.view.endEditing(true)
    }
    func verifyAge() {
        
        var dateOfBirth = dobDatePicker.date
        let today = Date()
        let gregorian = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let age = gregorian?.components([.month, .day, .year], from:  dobDatePicker.date, to: today, options:[])
        
    
        if (age?.year)! < 17 {
            dobDatePicker.setDate( dobDatePicker.date, animated: false)
            labtext.textColor = UIColor.red
            labtext.text = "Error"
            let alert = UIAlertController(title:"Error" , message: "Please Enter Correct DOB", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            print("false")
            
          //  txtAgeConfirmation.textColor = UIColor.red
            
        } else if (age?.year)! > 17 {
            dobDatePicker.setDate( dobDatePicker.date, animated: true)
            labtext.text = "true"
            labtext.textColor = UIColor.green
            let alert = UIAlertController(title:"Congrest" , message: "your DOB Correct for login", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
           // print("true")
           // txtAgeConfirmation.textColor = UIColor.black
            
        }
        
    }

}


