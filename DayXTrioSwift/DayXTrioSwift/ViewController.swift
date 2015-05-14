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
    var addButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Journal"
        
        tableView = UITableView.new()
        
        tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(tableView)
        
        self.setUpBarButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.reloadData()
    }
    
    func setUpBarButtonItem() {
        
        addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addEntry")
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    func addEntry() {
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.sharedInstance.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailViewController = DetailViewController.new()
        
        detailViewController.entry = EntryController.sharedInstance.entries[indexPath.row]
        
//        detailViewController.updateWithEntry(EntryController.sharedInstance.entries[indexPath.row])
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
        
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            EntryController.sharedInstance.removeEntry(EntryController.sharedInstance.entries[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

