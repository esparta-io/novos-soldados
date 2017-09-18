//
//  Task.swift
//  TODOLIST
//
//  Created by Leonardo Piovezan on 15/09/17.
//  Copyright © 2017 Leonardo Piovezan. All rights reserved.
//



class Task{

    var text:String
    var status:TaskStatus
    var id:Int

    init(text:String, status:TaskStatus, id:Int) {
        self.text = text
        self.status = status
        self.id = id
    }
}

extension Task:Equatable{

    static func == (left: Task, right: Task) -> Bool {
        return left.id == right.id
    }
}
enum TaskStatus {
    case done
    case incomplete
}
