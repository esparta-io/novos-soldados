//
//  Singleton.swift
//  Teste
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import UIKit

class Singleton{
    
    var listTodo: [TaskModel] = []
    var listDone: [TaskModel] = []
    
    
    class var sharedInstance: Singleton{
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
    func getListTodoSize() -> Int{
        return listTodo.count
    }
    
    func getListDoneSize() -> Int{
        return listDone.count
    }
    
    func getBackGroundCollor() -> UIColor{
        return UIColor(red: 31/255, green: 27/255, blue: 27/255, alpha: 1.0)
    }
    
    func getBackGroundCollorButton() -> UIColor{
        return UIColor(red: 54/255, green: 48/255, blue: 48/255, alpha: 0.9)
    }
    
    func insertNewTaskOnList(task: TaskModel){
        if(task.isFinish == false){
            listTodo.append(task)
        }
        if(task.isFinish == true){
            listDone.append(task)
        }
        else{
            print("erro")
        }
    }
    
    func removeTaskOnListToDo(index: Int){
        listTodo.removeAtIndex(index)
    }
    
}
