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
        if(segue != -1){    //Caso estaja editando muda o texto do botão;
                loadDataFromSegue()
                self.btnAdd.setTitle("Atualizar", forState: .Normal)
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
        return false        //retorna teclado
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAdd(sender: AnyObject) {
        self.view.makeToast("Adicionado com sucesso", duration: 2.0, position: .Top)
        if(segue == -1){        //Se o valor da segue é igual a -1 significa que a view esta no modo de adicionar uma nova tarefa
            let task = taskText.text
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let strDate = dateFormatter.stringFromDate(datePicker.date)
            let newTask = TaskModel(task: task!, dateTime: strDate)
            Singleton.sharedInstance.insertNewTaskOnList(newTask)
            taskText.text = ""
            taskText.placeholder = "De um nome para sua tarefa"
        } 
        if(segue != -1){        //Para valores difenrentes de -1, trata-se de uma edição, portanto preenche os campos com o texto da cell em edição
            let task = taskText.text
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let strDate = dateFormatter.stringFromDate(datePicker.date)
            let newTask = TaskModel(task: task!, dateTime: strDate)
            
            if(self.isFinish == true){
                Singleton.sharedInstance.removeTaskOnListDone(segue)
                Singleton.sharedInstance.insertTaskDoneList(newTask)
            }
            if(self.isFinish == false){
                Singleton.sharedInstance.removeTaskOnListToDo(segue)
                Singleton.sharedInstance.insertNewTaskOnList(newTask)


            }
            taskText.text = ""
            taskText.placeholder = "De um nome para sua tarefa"
            self.view.makeToast("Atualizado com sucesso", duration: 2.0, position: .Top)
            self.segue = -1         // Retorna ao status -1 para que não exita problema ao acessar a view novamente
            self.dismissViewControllerAnimated(true, completion: {});
        }
        self.segue = -1 // Retorna ao status -1 para que não exita problema ao acessar a view novamente
    }
}
