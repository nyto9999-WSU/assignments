//
//  EditFriend.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/21.
//

import UIKit

class EditFriend: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
    
    

    var editFn:String?
    var editLn:String?
    var editAge:String?
    var editGender:String?
    var editAdrs:String?
    var age:String = ""
    var gender:String = ""
    
    
    
  
    
    @IBOutlet weak var fnLabel: UILabel!
    @IBOutlet weak var lnLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var adrsLabel: UILabel!
    @IBOutlet weak var fnTextfield: UITextField!
    @IBOutlet weak var lnTextfield: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var genderTextfield: UITextField!
    @IBOutlet weak var stepForAge: UIStepper!
    @IBOutlet weak var segForGender: UISegmentedControl!


    @IBOutlet weak var adrsTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        stepForAge.wraps = true
        stepForAge.autorepeat = true
        stepForAge.maximumValue = 100
        fnTextfield.placeholder = editFn;
        lnTextfield.placeholder = editLn;
        ageLabel.text = "age: "+editAge!;
        if editGender == "Male" {
            segForGender.selectedSegmentIndex = 0
        }
        if editGender == "Female" {
            segForGender.selectedSegmentIndex = 1
        }
        adrsTextfield.placeholder = editAdrs;
        
   
      
    }
    
    
    @IBAction func ageStepper(_ sender: Any) {
        let step = Int(stepForAge.value)
        ageLabel.text = "Age: "+String(step)
        age = String(step)
    }
    
    
    @IBAction func remove(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.remove(key: editFn!)
        let controller = UIAlertController(title: "Success", message: "Deleted", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func update(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if self.segForGender.selectedSegmentIndex == 0 {
            gender = "Male"
        }
        if self.segForGender.selectedSegmentIndex == 1 {
            gender = "Female"
        }
     
        
        appDelegate.updateFriend(key: editFn!, fnChange: fnTextfield.text!, lnChange: lnTextfield.text!, ageChange: age, genderChange: gender, adrsChange: adrsTextfield.text!)
        
        let controller = UIAlertController(title: "Success", message: "Updated", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
 

    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let controller = segue.destination as? Map {
            controller.adrs = editAdrs
          }
        if let controller2 = segue.destination as? Gallery {
            controller2.Keyfn = editFn!
        }
    
    
 

    

    
  
  
}
    

}

