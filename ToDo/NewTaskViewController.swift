//
//  NewTaskViewController.swift
//  ToDo
//
//  Created by Gregory Mendes on 8/18/16.
//  Copyright © 2016 Gregory Mendes. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var newTaskText: UITextField!
    
    @IBAction func addNewTask(sender: AnyObject) {
        taskManager.newTask(newTaskText.text!, taskCompleted: false)
        self.view.endEditing(true)
        newTaskText.text = ""
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
