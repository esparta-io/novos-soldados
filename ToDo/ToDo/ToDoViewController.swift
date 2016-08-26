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
        self.view.makeToast("Swipe para esquerda para deletar", duration: 3.0, position: .Top)      //usando o lib Toast para exibir alerts em ação
        Singleton.sharedInstance.start()
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
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
        cell.button.addTarget(self, action: #selector(ToDoViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)       //detecta toque em um button da cell
        return cell
    }
    
    func buttonClicked(sender:UIButton) {
        
        let buttonRow = sender.tag
        let taskDone = Singleton.sharedInstance.listTodo[buttonRow] //recebe a tarefa equivalente a cell selecionada
        taskDone.isFinish = true        //marca tarefa como pronta
        Singleton.sharedInstance.insertNewTaskOnList(taskDone)     //insere na lista de Done
        Singleton.sharedInstance.removeTaskOnListToDo(buttonRow)   //apaga da lista ToDo
        tableView.reloadData()
        self.view.makeToast("Movido para Done", duration: 2.0, position: .Top)  //popup de alerta (Toast)

        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {    //Swipe left para deletar
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
                    [self.tableView .deselectRowAtIndexPath(indexPath, animated: true)]

                    
                case .Destructive:
                    print("destructive")
                }
            }))

        }


    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let detail = Singleton.sharedInstance.listTodo[indexPath.row].taskDescription
        let alert = UIAlertController(title: "Detalhes", message: "\(detail)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Editar", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("editar")
                if let _ = tableView.cellForRowAtIndexPath(indexPath) {
                    self.performSegueWithIdentifier("SendDataSegue2", sender: self)
                }
                [self.tableView .deselectRowAtIndexPath(indexPath, animated: true)]
                
            case .Cancel:
                print("ok")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendDataSegue2" {
            if let destination = segue.destinationViewController as? NewTaskViewController {
                let path = tableView.indexPathForSelectedRow?.item
                destination.segue = path!
                destination.isFinish = false             //TAREFA ESTÁ NO ESTADO TODO
            }
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
