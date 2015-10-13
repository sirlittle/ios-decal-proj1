//
//  StatsViewController.swift
//  ToDoList
//
//  Created by Salil Vanvari on 10/12/15.
//  Copyright © 2015 Salil Vanvari. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var numOfCompletedTasks: UILabel!
    var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numOfCompletedTasks.text = String(counter)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
