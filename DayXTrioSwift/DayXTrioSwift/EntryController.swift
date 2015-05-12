//
//  EntryController.swift
//  DayXTrioSwift
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntryController : NSObject {
    
    var entries:[Entry] {
        get {
            return Stack.sharedInstance.managedObjectContext.executeFetchRequest(NSFetchRequest(entityName:"Entry"), error: nil) as! Array
        }
    }
    
    //shared instance 
    
    static let sharedInstance = EntryController ()
    
    func createEntryWithDetails(title:String, text:String, date:NSDate) {
        var entry = NSEntityDescription.insertNewObjectForEntityForName("Entry", inManagedObjectContext: Stack.sharedInstance.managedObjectContext) as! Entry
        
        entry.title = title
        entry.text = text
        entry.date = date
        
        self.save()
    }
    
    func removeEntry(entry:Entry) {
        
        entry.managedObjectContext!.deleteObject(entry)
        self.save()
    }
    
    func save() {
        
        Stack.sharedInstance.managedObjectContext.save(nil)
    }
    
}
