//
//  ViewController.swift
//  ToDoList
//
//  Created by Salil Vanvari on 9/28/15.
//  Copyright © 2015 Salil Vanvari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var task:Task?
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textOutput: UITextField!
    //MARK: Navigation
    //This method lets you configure a view controller before its presented
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let taskDetails = textOutput.text ?? ""
            task = Task(task: taskDetails, done: false)
            
        }
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        // Disable the Save button while editing.
//        saveButton.enabled = false
//    }
//    
//    func checkValidTask() {
//        // Disable the Save button if the text field is empty.
//        let text = textOutput.text ?? ""
//        saveButton.enabled = !text.isEmpty
//    }
//    
//    func textFieldDidEndEditing(textField: UITextField) {
//        checkValidTask()
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        textOutput.delegate = self
//        checkValidTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

