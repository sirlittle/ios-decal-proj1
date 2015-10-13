//
//  Task.swift
//  ToDoList
//
//  Created by Salil Vanvari on 10/12/15.
//  Copyright © 2015 Salil Vanvari. All rights reserved.
//

import Foundation

class Task{
    
    var done:Bool
    var task:String
    var timeOfCompleteion:NSDate?
    
    init(task:String, done:Bool){
        self.done = done
        self.task = task
        timeOfCompleteion = nil
    }
    
    
}