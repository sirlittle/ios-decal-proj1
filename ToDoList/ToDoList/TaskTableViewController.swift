//
//  TaskTableViewController.swift
//  ToDoList
//
//  Created by Salil Vanvari on 10/12/15.
//  Copyright © 2015 Salil Vanvari. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {

    //MARK: Properties
//    var tasks = [String]()
//    var taskToState = [String:Bool]()
    var tasks = [Task]()
    
    func loadFirstTask(){
        let firsttask = Task(task: "Write a first task", done: false)
        tasks.append(firsttask);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstTask()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TaskTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TaskTableViewCell
        let task:Task = tasks[indexPath.row]
        // Configure the cell...
        cell.taskName.text = task.task;
        let check = task.done
        cell.assocTask = task
        if(!check){
            cell.completedButton.setTitle("Check", forState: .Normal)
            cell.assocTask.done = false
        }else{
            cell.completedButton.setTitle("UnCheck", forState: .Normal)
//            cell.contentView.backgroundColor = UIColor.greenColor()
            cell.assocTask.done = true
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        deleteOldTasks()
        self.tableView.reloadData()
    }
    
    func deleteOldTasks(){
        var toRemove:[Int] = []
        for i in 0..<tasks.count{
            if(tasks[i].timeOfCompleteion != nil){
                let time = NSDate().timeIntervalSinceDate(tasks[i].timeOfCompleteion!)
                if(time >= 86400){ //86400
                    toRemove.append(i)
                }
            }
        }
        for removeMe in toRemove{
            tasks.removeAtIndex(removeMe)
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let id:String = segue.identifier!
        if(id == "stats"){
            var counterOfDoneTasks = 0
            for task in tasks{
                if(task.done){
                    counterOfDoneTasks++
                }
            }
            let destinationVC = segue.destinationViewController as! StatsViewController
            destinationVC.counter = counterOfDoneTasks
        }
    }
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? ViewController, task = sourceViewController.task{
            let newIndexPath = NSIndexPath(forRow: tasks.count, inSection: 0)
            tasks.append(task)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
}
