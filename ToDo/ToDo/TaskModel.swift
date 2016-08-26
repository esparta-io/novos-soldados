//
//  TaskModel.swift
//  Teste
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import Foundation

class TaskModel{
    var taskDescription = ""
    var dateTime = ""
    var isFinish:Bool = false
    
    init(task: String, dateTime: String){
        self.taskDescription = task
        self.dateTime = dateTime
    }
}