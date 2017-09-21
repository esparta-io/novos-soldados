//
//  Tarefa.swift
//  ToDoEsparta
//
//  Created by Michel Rodrigo Mazzoni on 21/09/17.
//  Copyright © 2017 Michel Rodrigo Mazzoni. All rights reserved.
//

import Foundation

class Tarefa: NSObject {
    
    var nome: String
    var isDone: Bool
    
    init(nome: String, isDone: Bool) {
        self.nome = nome
        self.isDone = isDone
    }
    required init(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.isDone = aDecoder.decodeObject(forKey: "isDone") as! Bool
    }
}
