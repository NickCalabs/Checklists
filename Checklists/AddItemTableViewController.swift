//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Nick on 3/16/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller:AddItemTableViewController)
    func addItemViewController(controller: AddItemTableViewController, didFinishAddingItem item: ChecklistItem)
}


class AddItemTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        
        // dismissViewControllerAnimated(true, completion: nil) // was this before we added delegates
        
        let item = ChecklistItem()
        item.text = textField.text
        item.checked = false
        
        delegate?.addItemViewController(self, didFinishAddingItem: item)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText:NSString = textField.text
        let newText:NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        /*if newText.length > 0 {
            doneBarButton.enabled = true
        } else {
            doneBarButton.enabled = false
        }*/
        doneBarButton.enabled = (newText.length > 0)
        return true
    }

    
}

