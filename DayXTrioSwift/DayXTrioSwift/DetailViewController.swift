//
//  DetailViewController.swift
//  DayXTrioSwift
//
//  Created by Ethan Hess on 5/5/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var entryTitle = UITextField()
    var entryView = UITextView()
    var clearButton = UIButton()
    var saveButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Entry"
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        self.setsViews()
        self.tapDismiss()
        self.saveBarButtonItem()
        
    }
    
    func setsViews() {
        
        entryTitle = UITextField.new()
        entryTitle.frame = CGRectMake(30, 80, 300, 40)
        entryTitle.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(entryTitle)
        
        entryView = UITextView.new()
        entryView.frame = CGRectMake(30, 135, 300, 250)
        self.view.addSubview(entryView)
        
        clearButton = UIButton.new()
        clearButton.frame = CGRectMake(30, 400, 130, 40)
        clearButton.setTitle("Clear All", forState: UIControlState.Normal)
        clearButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        clearButton.backgroundColor = UIColor.redColor()
        clearButton.sizeToFit()
        clearButton.addTarget(self, action: "clearAll", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(clearButton)
    }
    
    func clearAll() {
        
        entryTitle.text = ""
        entryView.text = ""
    }
    
    func saveBarButtonItem() {
        
        saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveEntry")
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    func saveEntry() {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func tapDismiss() {
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        entryTitle.resignFirstResponder()
        entryView.resignFirstResponder()
        
        return true
        
    }
    
//    func textViewShouldEndEditing(textView: UITextView) -> Bool {
//        
//        textView.resignFirstResponder()
//        
//        return true
//    }
}




