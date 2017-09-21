//
//  TarefaUserDefaults.swift
//  ToDoEsparta
//
//  Created by Michel Rodrigo Mazzoni on 21/09/17.
//  Copyright © 2017 Michel Rodrigo Mazzoni. All rights reserved.
//

import UIKit

class TarefaUserDefaults {
    
    let chave = "listaTarefas"
    var tarefas = [Tarefa]()
    static let sharedTarefaUserDefaults = TarefaUserDefaults()
    
    func remover(indice: Int){
        
        tarefas = TarefaUserDefaults.sharedTarefaUserDefaults.listar()
        tarefas.remove(at: indice)
    }
    
    func salvar(tarefa: Tarefa){
        
        TarefaUserDefaults.sharedTarefaUserDefaults.tarefas.append(tarefa)
    }
    
    func listar() -> Array<Tarefa>{
        
        return TarefaUserDefaults.sharedTarefaUserDefaults.tarefas
    }
}
