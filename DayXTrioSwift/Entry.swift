//
//  Entry.swift
//  DayXTrioSwift
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import Foundation
import CoreData

@objc(Entry)
class Entry: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var text: String
    @NSManaged var date: NSDate

}
