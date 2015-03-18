//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Nick on 3/15/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
}