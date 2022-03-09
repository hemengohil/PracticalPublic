//
//  DatabaseHelper.swift
//  DRCPractical
//
//  Created by Hemen on 09/03/22.
//

import Foundation
import CloudKit
import CoreData

class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    let context = CoreDataStack.shared.managedContext
    
    init(){}
    
    @discardableResult  func fetchRequestFor(_ tblName: String) -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSManagedObject>(entityName: tblName) as! NSFetchRequest<NSFetchRequestResult>
    }

}
