//
//  TaskTableViewController.swift
//  TODOLIST
//
//  Created by Leonardo Piovezan on 15/09/17.
//  Copyright © 2017 Leonardo Piovezan. All rights reserved.
//

import UIKit

class TaskTableViewController: UIViewController{

    //MARK: OUTLETS
    @IBOutlet weak var taskTableView: UITableView!

    @IBOutlet weak var taskTextField: UITextField!

    @IBOutlet weak var tasksFilterSegmentedControl: UISegmentedControl!


    //MARK: Variables

    var taskList: [TaskViewModel] = []

    var allTaskList: [TaskViewModel] = []


    var indexPathToDelete:IndexPath!

    
    override func viewDidLoad() {
        super.viewDidLoad()


        initialConfigurations()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Auxiliar Functions

    func initialConfigurations(){
        taskTextField.delegate = self
        taskTextField.clearButtonMode = .whileEditing

        let task = Task(text: "tarefa", status: .incomplete,id:0)

        let taskViewModel = TaskViewModel(task: task)

        allTaskList.append(taskViewModel)
    }

    func confirmTaskDelete(){

        let alertDeleteTask = AlertViewManager.shared.getYesOrNoAlertWith(title: "Deletar Tarefa", message: "Você tem certeza de que deseja deletar essa tarefa?", style: .alert, action: deleteAlertAction)

        self.present(alertDeleteTask, animated: true) {}

    }


    func deleteAlertAction(){
        deleteTaskAt(indexPath: indexPathToDelete)

    }
    func deleteTaskAt(indexPath:IndexPath){

        let index = indexPath.row
        self.allTaskList.remove(at: index)
        filterTasks()
        self.taskTableView.reloadData()

    }

    func addTask(task:Task){

        let taskViewModel = TaskViewModel(task: task)
        self.allTaskList.append(taskViewModel)
        self.taskTableView.reloadData()
    }
    

    func filterTasks(){

        switch tasksFilterSegmentedControl.selectedSegmentIndex {
        case 1:
            taskList =  allTaskList.filter({$0.taskStatus == .done})
        case 2:
            taskList = allTaskList.filter({$0.taskStatus == .incomplete})
        default:
           taskList = allTaskList
        }
    }




    //MARK: ACTIONS

    @IBAction func filterTasksAction(_ sender: Any) {

        taskTableView.reloadData()
    }


}

  // MARK: - Table view data source and Delegate

extension TaskTableViewController:UITableViewDataSource,UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterTasks()
        return taskList.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        cell.selectionStyle = .none

        let row = indexPath.row
        let taskViewModel = taskList[row]

        cell.textLabel?.text = taskViewModel.taskText
        cell.imageView?.image = taskViewModel.taskStatusImage



        return cell
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete{

            if tasksFilterSegmentedControl.selectedSegmentIndex == 0{
                indexPathToDelete = indexPath
            }else {
                let task = taskList[indexPath.row]
                guard let position = allTaskList.index(of: task) else {
                    return
                }
                indexPathToDelete = IndexPath(row: position, section: 0)

            }

            confirmTaskDelete()

        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        taskList[indexPath.row].changeTaskStatus()
        if tasksFilterSegmentedControl.selectedSegmentIndex != 0 {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else{
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    

}

    //MARK: TextField Delegate
extension TaskTableViewController:UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != ""{

            guard let taskText = textField.text else{
                return true
            }
            let task = Task(text: taskText, status: .incomplete, id:allTaskList.count)

            addTask(task: task)
            textField.text = ""

        }

        return textField.resignFirstResponder()
    }
}
