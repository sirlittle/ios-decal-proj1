//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Salil Vanvari on 10/11/15.
//  Copyright © 2015 Salil Vanvari. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    var assocTask:Task = Task(task: "default", done: true)
    
    @IBAction func finishedTask(sender: UIButton) {
        if(assocTask.done){
            assocTask.done = false
            self.backgroundColor = UIColor.whiteColor()
            completedButton.setTitle("Check", forState: .Normal)
            assocTask.timeOfCompleteion = nil
        }
        else{
            assocTask.done = true
            self.backgroundColor = UIColor.greenColor()
            completedButton.setTitle("Uncheck", forState: .Normal)
            assocTask.timeOfCompleteion = NSDate()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
