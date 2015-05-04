//
//  ViewController.swift
//  DayXTrioSwift
//
//  Created by Ethan Hess on 5/4/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Journal"
        
        tableView = UITableView.new()
        
        tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entryTitleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        cell.textLabel?.text = self.entryTitleArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("Hey")
        
    }
    
    var entryTitleArray: [String] = ["Entry 1", "Entry 2", "Entry 3", "Entry 4", "Entry 5"]

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

