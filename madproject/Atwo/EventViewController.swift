//
//  EventViewController.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/30.
//

import UIKit
import CoreData

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var EventArray=[String]()
    
    @IBOutlet weak var tableview: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

    return 1

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.getEvent().e.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        cell.taskItem.text = appDelegate.getEvent().e[indexPath.row]
        EventArray.append(appDelegate.getEvent().e[indexPath.row])
        cell.locationItem.text = appDelegate.getEvent().l[indexPath.row]
        
        //dt create at//
        let temp:String = appDelegate.getEvent().dt[indexPath.row]
        let dtStr = NSString(string: temp)
        var dtItem = dtStr.replacingOccurrences(of: "-", with: "")
        dtItem = dtItem.replacingOccurrences(of: " ", with: "")
        dtItem = dtItem.replacingOccurrences(of: ":", with: "")
        dtItem = dtItem.replacingOccurrences(of: "/", with: "")
        let intCreatedAt = (dtItem as NSString).integerValue
        print(intCreatedAt)
        //current time///
        let current = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHmm"
        let nowString = formatter.string(from: current)
        let intNow = (nowString as NSString).integerValue
        print(intNow)
        
       //check expired//
        if intCreatedAt < intNow {
            cell.datetimeItem.text = "Expired"
        }
        else
        {
            cell.datetimeItem.text = appDelegate.getEvent().dt[indexPath.row]
        }
        

       
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.getContext()
        
        let query = EventArray[indexPath.row]
        appDelegate.removeEvent(key: query)
    
        let controller = UIAlertController(title: "success", message: "deleted", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)

    
        
  
        
        
       
      
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(EventArray)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
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
