//
//  AddFriend.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/21.
//

import UIKit

class AddFriend: UIViewController {
  
    
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var fn: UITextField!
    @IBOutlet weak var ln: UITextField!
    @IBOutlet weak var stepForAge: UIStepper!
    
    @IBOutlet weak var segForGender: UISegmentedControl!
   
    @IBOutlet weak var adrstextview: UITextView!
    
    
    @IBOutlet weak var ageLabel: UILabel!
    var age:String = ""
  
    var sta:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepForAge.wraps = true
        stepForAge.autorepeat = true
        stepForAge.maximumValue = 100
     
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func stepperChange(_ sender: Any) {
        
        let step = Int(stepForAge.value) // using an integer variable
        age = String(step)
        ageLabel.text = "Age: "+String(step)
    }
    
    
    
    /*@IBAction func pictures(_ sender: Any) {
       
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            present(vc, animated: true)
        }
 */
        

    
    
    @IBAction func submit(_ sender: Any) {
        
        if self.segForGender.selectedSegmentIndex == 0 {
            sta = "Male"
        }
        if self.segForGender.selectedSegmentIndex == 1 {
            sta = "Female"
        }
        
     
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.storeFriend(firstName: fn.text!, lastName: ln.text!, age: age, gender: sta, address: adrstextview.text!)
        let controller = UIAlertController(title: "Success", message: "Submited", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

