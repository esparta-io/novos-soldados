//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = Singleton.sharedInstance.getBackGroundCollor()
        self.view.makeToast("Swipe para esquerda para deletar", duration: 3.0, position: .Top)
        Singleton.sharedInstance.start()
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        print("oi")
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ToDoTableViewCell = tableView.dequeueReusableCellWithIdentifier("toDo", forIndexPath: indexPath) as! ToDoTableViewCell
        if(Singleton.sharedInstance.getListTodoSize() > 0){
            let textTask = Singleton.sharedInstance.listTodo[indexPath.row].taskDescription
            let date = Singleton.sharedInstance.listTodo[indexPath.row].dateTime
            cell.setCell(textTask, date: date)
        }
        cell.backgroundColor = Singleton.sharedInstance.getBackGroundCollorButton()

        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(ToDoViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }
    
    func buttonClicked(sender:UIButton) {
        
        let buttonRow = sender.tag
        print(buttonRow)
        let taskDone = Singleton.sharedInstance.listTodo[buttonRow]
        taskDone.isFinish = true
        Singleton.sharedInstance.insertNewTaskOnList(taskDone)
        Singleton.sharedInstance.removeTaskOnListToDo(buttonRow)
        tableView.reloadData()
        self.view.makeToast("Movido para Done", duration: 2.0, position: .Top)

        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let alert = UIAlertController(title: "Atenção", message: "Tem certeza que deseja deletar essa tarefa?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Não", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Sim", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    Singleton.sharedInstance.removeTaskOnListToDo(indexPath.row)
                    self.tableView.reloadData()
                    self.view.makeToast("Deletado", duration: 1.3, position: .Top)

                    
                case .Cancel:
                    print("cancel")
                    
                case .Destructive:
                    print("destructive")
                }
            }))

        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(Singleton.sharedInstance.getListTodoSize() == 0){
            return 0
        }
        else{
            return Singleton.sharedInstance.getListTodoSize()
        }
    }

}
