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
    
    func start(){
        var newTask = TaskModel(task: "Comprar bolo aniversário", dateTime: "21-09-2016 12:00")
        listTodo.append(newTask)
        newTask = TaskModel(task: "Terminar trabalho de IA", dateTime: "23-09-2016 21:00")
        listTodo.append(newTask)
        newTask = TaskModel(task: "Levar bike para manutenção", dateTime: "10-10-2016 13:00")
        listTodo.append(newTask)
        newTask = TaskModel(task: "Clique em mim para ver ler/ atualizar a tarefa.", dateTime: "12-10-2016 13:00")
        listTodo.append(newTask)
        newTask = TaskModel(task: "Terminar App teste para Esparta", dateTime: "26-09-2016 23:00")
        newTask.isFinish = true
        listDone.append(newTask)
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
        }
    }
    
    func removeTaskOnListToDo(index: Int){
        listTodo.removeAtIndex(index)
    }
    
    func removeTaskOnListDone(index: Int){
        listDone.removeAtIndex(index)
    }
    
    func insertTaskDoneList(task: TaskModel){
        listDone.append(task)
    }
    
}
