//
//  CoreDataStore.swift
//  Appt
//
//  Created by Agustin Mendoza Romo on 5/30/17.
//  Copyright © 2017 AgustinMendoza. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore {
    
    static var instance: CoreDataStore = CoreDataStore(dataModel: "AppointmentModel")
    
    
    init(dataModel: String) {
      persistentContainer = NSPersistentContainer(name: dataModel)
      persistentContainer.loadPersistentStores { (desc, error) in
        if let error = error as NSError? {
          print("Persist container failed", error.localizedDescription)
        }
      }
    }

    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppointmentModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext { return persistentContainer.viewContext }



    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
  
  

  
//  func save() {
//    guard context.hasChanges else {
//      return
//    }
//    do {
//      try context.save()
//    }
//    catch {
//      print("Saving didn't work!", error)
//    }
//  }
}

