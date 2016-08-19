//
//  TaskManager.swift
//  ToDo
//
//  Created by Gregory Mendes on 8/18/16.
//  Copyright © 2016 Gregory Mendes. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct  task {
    var taskTitle = "Task Title"
    var taskCompleted = false
    
}

class TaskManager: NSObject{
    
    var tasks = [task]()
    
    func newTask(taskTitle: String, taskCompleted: Bool){
        
        tasks.append(task(taskTitle: taskTitle, taskCompleted: taskCompleted))
    }
}