//
//  CadastroTarefaViewController.swift
//  ToDoEsparta
//
//  Created by Michel Rodrigo Mazzoni on 21/09/17.
//  Copyright © 2017 Michel Rodrigo Mazzoni. All rights reserved.
//

import UIKit

class CadastroTarefaViewController: UIViewController {
    
    
    @IBOutlet weak var tarefaCampo: UITextField!
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let textoDigitado = tarefaCampo.text{
            
            let tarefa = TarefaUserDefaults()
            tarefa.salvar(tarefa: Tarefa(nome: textoDigitado, isDone: false))
            tarefaCampo.text=""
            self.navigationController?.popViewController(animated: true)
        }

    }
    //MARK: Escondendo o teclado ao clicar fora do campo de texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
