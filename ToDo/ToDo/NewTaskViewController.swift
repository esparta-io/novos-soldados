//
//  NewTaskViewController.swift
//  ToDo
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnAdd: UIButton!
    var segue = -1                                  //se estiver em -1, não está em modo de editação
    var isFinish = false                            //VARIÁVEIS PARA AUXILIAR O SEGUE, PARA EDIÇÃO

    
    
    override func viewDidLoad() {
        self.view.backgroundColor = Singleton.sharedInstance.getBackGroundCollor()
        btnAdd.backgroundColor = Singleton.sharedInstance.getBackGroundCollorButton()
        self.datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        self.taskText.delegate = self
        let currenteDate = NSDate()
        self.datePicker.minimumDate = currenteDate
        if(segue != -1){
                loadDataFromSegue()
                self.btnAdd.setTitle("Atualizar", forState: .Normal)//Caso estaja atualizando muda o texto do botão
        }
        
        super.viewDidLoad()

    }

    func loadDataFromSegue(){
        if(isFinish == true){
            taskText.text = Singleton.sharedInstance.listDone[segue].taskDescription
        }
        if(isFinish == false){
            taskText.text = Singleton.sharedInstance.listTodo[segue].taskDescription
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAdd(sender: AnyObject) {
        self.view.makeToast("Adicionado com sucesso", duration: 2.0, position: .Top)
        if(segue == -1){
            let task = taskText.text
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let strDate = dateFormatter.stringFromDate(datePicker.date)
            let newTask = TaskModel(task: task!, dateTime: strDate)
            Singleton.sharedInstance.insertNewTaskOnList(newTask)
            taskText.text = ""
            taskText.placeholder = "De um nome para sua tarefa"
        } 
        if(segue != -1){
            if(self.isFinish == true){
                let task = taskText.text
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
                let strDate = dateFormatter.stringFromDate(datePicker.date)
                let newTask = TaskModel(task: task!, dateTime: strDate)
                Singleton.sharedInstance.removeTaskOnListDone(segue)
                Singleton.sharedInstance.insertTaskDoneList(newTask)
            }
            if(self.isFinish == false){
                let task = taskText.text
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
                let strDate = dateFormatter.stringFromDate(datePicker.date)
                let newTask = TaskModel(task: task!, dateTime: strDate)
                Singleton.sharedInstance.removeTaskOnListToDo(segue)
                Singleton.sharedInstance.insertNewTaskOnList(newTask)


            }
            taskText.text = ""
            taskText.placeholder = "De um nome para sua tarefa"
            self.view.makeToast("Atualizado com sucesso", duration: 2.0, position: .Top)
            self.segue = -1
            self.dismissViewControllerAnimated(true, completion: {});
        }
        self.segue = -1
    }
}
