//
//  ToDoTableViewCell.swift
//  ToDo
//
//  Created by Murilo Erhardt on 21/08/16.
//  Copyright © 2016 Murilo Erhardt. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskText: UILabel!
    @IBOutlet weak var dateTask: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setCell(task: String, date: String){
        self.button.backgroundColor = Singleton.sharedInstance.getBackGroundCollor()
        self.taskText.text = task
        self.dateTask.text = date
    }

}
