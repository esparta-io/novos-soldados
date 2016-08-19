//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by Gregory Mendes on 8/18/16.
//  Copyright © 2016 Gregory Mendes. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskText: UILabel!    
    
    @IBOutlet weak var taskStatusButton: UISwitch!
    
    @IBAction func taskStatus(sender: UISwitch) {
        
    }
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
