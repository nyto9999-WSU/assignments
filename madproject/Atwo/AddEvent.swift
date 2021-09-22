//
//  AddEvent.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/27.
//

import UIKit

class AddEvent: UIViewController {

    @IBOutlet weak var evenInput: UITextField!
    @IBOutlet weak var locationInput: UITextField!
    @IBOutlet weak var datetimeInput: UIDatePicker!
    var name: String = ""
    var loc: String = ""
    var selectedDate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateCheck(_ sender: Any) {
        let datavalue = DateFormatter()
        datavalue.dateFormat = "YYYY/MM/dd HH:mm"
        selectedDate = datavalue.string(from: datetimeInput.date)
        
    }
    
    @IBAction func submit(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if evenInput.text!.isEmpty || locationInput.text!.isEmpty || selectedDate.isEmpty {
            
            let controller = UIAlertController(title: "Empty input is not allowed", message: "Please check your inputs whether empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
        }
        else{
            
            appDelegate.storeEvent(event: evenInput.text!, location: locationInput.text!, datetime: selectedDate)
            let controller = UIAlertController(title: "Success", message: "back to event list", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
          
        }
        
        
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
