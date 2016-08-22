//
//  NewTaskViewController.swift
//  ToDo
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var taskText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = Singleton.sharedInstance.getBackGroundCollor()
        btnAdd.backgroundColor = Singleton.sharedInstance.getBackGroundCollorButton()
        self.datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAdd(sender: AnyObject) {
        let task = taskText.text
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        let newTask = TaskModel(task: task!, dateTime: strDate)
        Singleton.sharedInstance.insertNewTaskOnList(newTask)
        taskText.text = ""
        
    }
}
