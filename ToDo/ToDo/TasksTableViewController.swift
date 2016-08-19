//
//  TasksTableViewController.swift
//  ToDo
//
//  Created by Gregory Mendes on 8/18/16.
//  Copyright © 2016 Gregory Mendes. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TasksTableViewController.loadList(_:)),name:"load", object: nil)

    }
    
    func loadList(notification: NSNotification){
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskManager.tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskTableViewCell
        let task = taskManager.tasks[indexPath.row]
        
        cell.taskText.text = task.taskTitle
        if task.taskCompleted == false{
            cell.taskStatusButton.setOn(false, animated: true)
        }else{
            cell.taskStatusButton.setOn(true, animated: true)
        }
        return cell
    }
    
    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let deleteTaskAlert = UIAlertController(title: "Delete task", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
            
            presentViewController(deleteTaskAlert, animated: true, completion: nil)
            
            deleteTaskAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                taskManager.tasks.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                self.tableView.reloadData()
            }))
            deleteTaskAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
                
            }))
            
        }
    }
    
    

}
