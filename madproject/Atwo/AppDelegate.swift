//
//  AppDelegate.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/15.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Atwo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storeFriend (firstName: String, lastName: String, age: String, gender: String, address: String) //,pic:UIImageView)
    {
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Friend", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(firstName, forKey: "firstname")
        transc.setValue(lastName, forKey: "lastname")
        transc.setValue(age, forKey: "age")
        transc.setValue(gender, forKey: "gender")
        transc.setValue(address, forKey: "address")
        transc.setValue("image1", forKey: "icon")
       
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func getFriend () -> (fns:Array<String>, lns:Array<String>, ages:Array<String>, genders:Array<String>, addresses:Array<String>, icon:Array<String>){
        var fns = [String]()
        var lns = [String]()
        var ages = [String]()
        var genders = [String]()
        var addresses = [String]()
        var icons = [String]()
      
        //create a fetch request, telling it about the entity
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                let fn = trans.value(forKey: "firstname") as! String
                let ln = trans.value(forKey: "lastname") as! String
                let age = trans.value(forKey: "age") as! String
                let gender = trans.value(forKey: "gender") as! String
                let address = trans.value(forKey: "address") as! String
                let icon = trans.value(forKey: "icon") as! String
            
                fns.append(fn)
                lns.append(ln)
                ages.append(age)
                genders.append(gender)
                addresses.append(address)
                icons.append(icon)
              
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        return (fns,lns,ages,genders,addresses,icons)
        
    }
    
    

    /*func remove(key: String) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        fetchRequest.predicate = NSPredicate(format: "firstname == %@", key)
        let context = getContext()
        let results = try? context.fetch(fetchRequest)
        let resultData = results as! [Friend]
        
        for object in resultData {
            context.delete(object)
        }
        do{
            try context.save()
            print("save")
        } catch let error as  NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
            
    }*/

    func remove(key:String)  {
        
        let context = getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
        request.predicate = NSPredicate(format: "firstname == %@", key)
        
        let result = try? context.fetch(request)
        let reusltData = result as! [NSManagedObject]
        
        for object in reusltData {
            context.delete(object)
        }
        do {
                  try context.save()
                  print("TABLEVIEW-EDIT: saved!")
              } catch let error as NSError  {
                  print("Could not save \(error), \(error.userInfo)")
              } catch {
                  // add general error handle here
              }
        
        
        
    }
   
    
    func updateFriend(key: String, fnChange: String, lnChange: String, ageChange: String, genderChange: String, adrsChange: String){
        let request = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        request.predicate = NSPredicate(format: "firstname == %@", key)
        let context = getContext()
        do{
            let results = try context.fetch(request) as! [Friend]
          
            if (results.count > 0){
                let Friend = results[0]
                
                if fnChange !=  Friend.firstname && !fnChange.isEmpty{
                    Friend.firstname = fnChange;
                }
                if lnChange != Friend.lastname && !lnChange.isEmpty{
                    Friend.lastname = lnChange;
                }
                if ageChange != Friend.age && !ageChange.isEmpty{
                    Friend.age = ageChange;
                }
                if genderChange != Friend.gender && !genderChange.isEmpty{
                    Friend.gender = genderChange;
                }
                if adrsChange != Friend.address && !adrsChange.isEmpty{
                    Friend.address = adrsChange;
                }
         

                try context.save()
            }
        } catch {
            fatalError("Failed to update data: \(error)")
        }
    }
    
    func updateIcon(key: String, pic: String){
        let request = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        request.predicate = NSPredicate(format: "firstname == %@", key)
        let context = getContext()
        do{
            let results = try context.fetch(request) as! [Friend]
          
            if (results.count > 0){
                let Friend = results[0]
                
                Friend.icon = pic
                
         

                try context.save()
            }
        } catch {
            fatalError("Failed to update data: \(error)")
        }
    }
    
    // Event
    
    func storeEvent (event:String, location: String, datetime: String) {
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Event", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(event, forKey: "event")
        transc.setValue(location, forKey: "location")
        transc.setValue(datetime, forKey: "datetime")
  
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func getEvent () -> (e:Array<String>, l:Array<String>, dt:Array<String>){
        var e = [String]()
        var l = [String]()
        var dt = [String]()
    
        
        //create a fetch request, telling it about the entity
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Event")
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                let event = trans.value(forKey: "event") as! String
                let location = trans.value(forKey: "location") as! String
                let datetime = trans.value(forKey: "datetime") as! String
    
            
                e.append(event)
                l.append(location)
                dt.append(datetime)
           
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        return (e,l,dt)
        
    }
    
    func removeEvent(key:String)  {
        
        let context = getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
        request.predicate = NSPredicate(format: "event == %@", key)
        
        let result = try? context.fetch(request)
        let reusltData = result as! [NSManagedObject]
        
        for object in reusltData {
            context.delete(object)
        }
        do {
                  try context.save()
                  print("TABLEVIEW-EDIT: saved!")
              } catch let error as NSError  {
                  print("Could not save \(error), \(error.userInfo)")
              } catch {
                  // add general error handle here
              }
        
        
        
    }

}

