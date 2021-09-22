//
//  Gallery.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/31.
//

import UIKit
import CoreData

class Gallery: UIViewController {
    var Keyfn:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func image01(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.updateIcon(key: Keyfn, pic: "image1")
        let controller = UIAlertController(title: "Success", message: "Icon Changed", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func image02(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.updateIcon(key: Keyfn, pic: "image2")
        let controller = UIAlertController(title: "Success", message: "Icon Changed", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    @IBAction func image03(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.updateIcon(key: Keyfn, pic: "image3")
        let controller = UIAlertController(title: "Success", message: "Icon Changed", preferredStyle: .alert)
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
