//
//  CoreDataStack.swift
//  DRCPractical
//
//  Created by Hemen on 09/03/22.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    
    public static let shared: CoreDataStack = {
        return CoreDataStack.init(modelName: "DRCPractical")
    }()
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    private lazy var storeContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                vPrint("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    @discardableResult func saveContext () -> Bool {
        guard managedContext.hasChanges else { return false }
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            vPrint("Unresolved error \(error), \(error.userInfo)")
            return false
        }
    }
}

func vPrint(_ items: Any...) {
#if DEBUG
    for item in items {
        print(item)
    }
#endif
}
