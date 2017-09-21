//
//  TarefasTableViewController.swift
//  ToDoEsparta
//
//  Created by Michel Rodrigo Mazzoni on 21/09/17.
//  Copyright © 2017 Michel Rodrigo Mazzoni. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    var tarefas:[Tarefa] = []
    var selectedIndex = Int();
    var concluido:[Tarefa] = []
    var pendente:[Tarefa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: Atualizando os dados da lista
    func atualizarListaTarefas(){
        tarefas = TarefaUserDefaults.sharedTarefaUserDefaults.listar()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizarListaTarefas()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            self.pendente = self.tarefas.filter({$0.isDone == false})
            return self.pendente.count
        }else if section == 1{
            self.concluido = self.tarefas.filter({$0.isDone == true})
            return self.concluido.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            pendente[indexPath.row].isDone = true
        }else if indexPath.section == 1{
            concluido[indexPath.row].isDone = false
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        if indexPath.section == 0 {
            celula.textLabel?.text = pendente[indexPath.row].nome
        }else if indexPath.section == 1{
            celula.textLabel?.text = concluido[indexPath.row].nome
        }
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Pendente"
        }else if section == 1{
            return "Concluidos"
        }
        
        return ""
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let alertaController = UIAlertController(title: "Excluindo Tarefa", message: "Tem certeza que realmente deseja deletar a tarefa?", preferredStyle: .alert)
            
            let acaoConfirmar = UIAlertAction(title: "DELETAR", style: .destructive) { (action) -> Void in
                TarefaUserDefaults.sharedTarefaUserDefaults.remover(indice: indexPath.row)
                self.atualizarListaTarefas()
            }
            let acaoCancelar = UIAlertAction(title: "CANCELAR", style: .cancel) { (action) -> Void in self.atualizarListaTarefas()}
            alertaController.addAction(acaoConfirmar)
            alertaController.addAction(acaoCancelar)
            present(alertaController, animated: true, completion: nil)
        }
    }
}
