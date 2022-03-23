//
//  CoreDataStack.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation
import CoreData


class CoreDataStack {
    
    static let manager = CoreDataStack()
    
    var viewContext: NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    fileprivate lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "hov_assesment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
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
    
    private init() {
        
    }
}
