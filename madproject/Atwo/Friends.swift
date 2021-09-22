//
//  Friends.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/21.
//

import UIKit
import CoreData

class Friends: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    @IBOutlet weak var tb: UITableView!
    var friend:[String] = [];
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

    return 1

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.getFriend().ages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? FriendTableViewCell
        
     
        
        cell?.friendFn.text = appDelegate.getFriend().fns[indexPath.row]
        cell?.friendLn.text = appDelegate.getFriend().lns[indexPath.row]
        cell?.friendAge.text = appDelegate.getFriend().ages[indexPath.row]
        cell?.friendGender.text = appDelegate.getFriend().genders[indexPath.row]
        cell?.friendAdrs.text = appDelegate.getFriend().addresses[indexPath.row]
        cell?.friendImage.image = UIImage(named: appDelegate.getFriend().icon[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let controller = segue.destination as? EditFriend, let indexPath = self.tb.indexPathForSelectedRow {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            controller.editFn = appDelegate.getFriend().fns[indexPath.row]
            controller.editLn = appDelegate.getFriend().lns[indexPath.row]
            controller.editAge = appDelegate.getFriend().ages[indexPath.row]
            controller.editGender = appDelegate.getFriend().genders[indexPath.row]
            controller.editAdrs = appDelegate.getFriend().addresses[indexPath.row]
            
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
}

