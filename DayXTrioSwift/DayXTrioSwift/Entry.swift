//
//  Entry.swift
//  DayXTrioSwift
//
//  Created by Ethan Hess on 5/5/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import Foundation

class Entry: NSObject {
    
    var titleKey = "title"
    var bodyTextKey = "bodyText"
    var timeStampKey = "timeStamp"
    
    var title = NSString()
    var text = NSString()
    var timeStamp = NSDate()
    
    convenience init(_ dictionary: Dictionary<String, AnyObject>) {
        self.init()
        
        title = (dictionary[titleKey] as? NSString)!
        text = (dictionary[bodyTextKey] as? NSString)!
        timeStamp = (dictionary[timeStampKey] as? NSDate)!
        
    }
    
//    var dictionaryOfEntries: NSDictionary = [
//    
//        
//    ]
    
}