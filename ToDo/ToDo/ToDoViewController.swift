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
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(Singleton.sharedInstance.getListTodoSize() == 0){
            return 4
        }
        else{
            return Singleton.sharedInstance.getListTodoSize()
        }
    }

}
