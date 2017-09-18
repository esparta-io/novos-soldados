//
//  TaskViewModel.swift
//  TODOLIST
//
//  Created by Leonardo Piovezan on 15/09/17.
//  Copyright © 2017 Leonardo Piovezan. All rights reserved.
//

import UIKit

class TaskViewModel {

    private var task:Task

    var taskText:String{

        set(text){
            self.task.text = text
        }
        get{
            return task.text
        }

    }

    var taskStatus:TaskStatus{

        set(status){
            self.task.status = status
        }

        get{
            return  task.status
        }
    }

    var taskStatusImage:UIImage{

        if task.status == .done{
            return #imageLiteral(resourceName: "checkedBox.png")
        } else {
            return #imageLiteral(resourceName: "uncheckedBox.png")
        }
    }

    var taskId:Int{
        return task.id
    }
    init(task:Task) {
        self.task = task
    }

    func changeTaskStatus(){

        if task.status == .incomplete{
            task.status = .done
        } else {
            task.status = .incomplete
        }
    }
    
}

extension TaskViewModel:Equatable{

    static func == (left:TaskViewModel,right:TaskViewModel)->Bool{

        let leftId = left.taskId
        let rightId = right.taskId

        return leftId == rightId
    }
}
