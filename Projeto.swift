/* 
 * DESCRICAO:
 *		Simples codigo para controle de tarefas. Possui as seguintes funcionalidades:
 *		- Adicionar tarefa
 *      - Remover tarefas
 *      - Concluir tarefas pendentes
 *      - Retornar tarefas para pendentes
 *      - Visualizar tarefas pendentes
 *      - Visualizar tarefas concluidas
 *      
 * PLATAFORMA:
 *		SO: Linux Fedora 25
 *		ARQ: x86_64
 *		
 * COMPILADOR:
 *		Swift 3.1 
 *
 * DESENVOLVIDO POR:
 *		Thiago dos Santos Martins
 *		email: thiago.martins1989@gmail.com
 *
 * OBS. Por nao possuir um mac para desenvolvimento, utilizei-me dos compiladores
 *	    online do swift(https://swift.sandbox.bluemix.net/#/repl PARA TESTES) e o do linux
 *		(https://github.com/FedoraSwift/fedora-swift PORTE PARA FEDORA / PLATAFORMA UTILIZADA).
 *      (https://swift.org/download/#releases VERSAO UBUNTU PARA VERIFICACAO). 
 *		Por causa disto, fiquei impossibilitado de empregar uma GUI ficando, assim, 
 *      limitado ao terminal.
 *
 */

// Biblioteca especifica para utilizar chamadas do sistema
import Glibc;

// Classe que fornece todas as funcionalidades das tarefas
class Tarefa
{
	// Emprego de dicionarios para vinculacao de chave : valor
	// onde chave e o titulo da tarefa e valor a descricao dela
	private var todo = [String : String]();
	private var backup = [String : String]();
	private var finalizado = [String : String]();
	private var resposta: String?;
	
	// Funcao responsavel por adicionar as tarefas
	func Adiciona(titulo: String, descricao: String = "") -> Void
	{
		// Caso nao tenha um titulo, nao e possivel adicionar uma nova tarefa
		if(titulo == "")
		{
			print("Voce deve colocar um titulo para a tarefa!!!");

		}
		else
		{
			todo[titulo] = descricao;
			print("Tarefa Adicionada!!!");

		}
			
	}
	
	// Funcao que remove a tarefa do dicionario
	func Remove(titulo: String) -> Void
	{
		// Se a chave/titulo existe, executa-se o bloco
		if(todo[titulo] != nil)
		{
			print("Voce realmente deseja apagar esta tarefa? (s/n)");
			resposta = readLine();

			if(resposta == "S" || resposta == "s" || resposta == "sim" ||
			   resposta == "Sim" || resposta == "SIM" || resposta == "si")
			{
				todo.removeValue(forKey: titulo);
				print("Tarefa removida!!!");

				_ = readLine();

			}

		}
		else 
		{
			print("Tarefa nao encontrada!!!");

		}
			
	}
	
	// Finaliza uma tarefa especifica
	func Finalizar() -> Void
	{
		Pendente();

		print("Marcar como finalizada: ");
		resposta = readLine();

		if(todo[resposta!] != nil)
		{
			finalizado[resposta!] = todo[resposta!];
			todo.removeValue(forKey: resposta!);

			print("Tarefa Finalizada!!!");

		}

	}

	// Modifica o status de uma tarefa. Se uma tarefa
	// foi marcada como finalizada, esta por ser retornada
	// ao status de pendente, conforme necessario
	func Retornar() -> Void
	{
		print("\n");

		resposta = readLine();

		if(finalizado[resposta!] != nil)
		{
			todo[resposta!] = finalizado[resposta!];

			print("Tarefa retornada para pendente");

		}

	}

	// Funcao que mostra na tela as tarefas finalizada, em ordem alfabetica.
	func Finalizado() -> Void
	{
		if(finalizado.isEmpty)
		{
			print("Voce nao finalizou nenhuma Tarefa \n");
		
		}
		else
		{
			for (titulo, descricao) in Array(finalizado).sorted(by: {$0.0 < $1.0})
			{
				print("Tarefa: \(titulo)");
				print("Descricao: \(descricao)");
				print("---------------------------");

			}

		}

	}

	// Funcao que mostra na tela as tarefas pendentes, em ordem alfabetica
	func Pendente() -> Void
	{
		if(todo.isEmpty)
		{
			print("Voce nao tem nenhuma tarefa pendente \n");
		
		}
		else
		{
			for (titulo, descricao) in Array(todo).sorted(by: {$0.0 < $1.0})
			{
				print("Tarefa: \(titulo)");
				print("Descricao: \(descricao)");
				print("---------------------------");

			}

		}

	}

}

// Estrutura responsavel por centralizar as funcionalidades do menu
// e das tarefas. Utilizada por motivos de demonstracao
struct Menu
{
	var escolha: String?;
	let tf = Tarefa();
	var titulo: String?;
	var descricao: String?;

	// Menu Principal
	// aqui sao feitas as selecoes de processos
	mutating func Principal() -> Void
	{
		// A primeira tela do sistema mostra as tarefas pendentes
		tf.Adiciona(titulo: "Estagio", descricao: "Fazer um pequeno projeto para vaga de estagio iOS");

		system("clear");
		print("SEJA BEM-VINDO!!! \n")
		print("Verifique suas Tarefas Pendentes \n");
		tf.Pendente();

		print("\n");
		print("Pressione ENTER para entrar no MENU PRINCIPAL");

		escolha = readLine();

		system("clear");

		// A proxima tela e o menu inicial, onde pode-se selecionar o que
		// deseja fazer
		while(true)
		{
			print("AD ASTRA PER ASPERA \n");

			print("MENU PRINCIPAL \n");
			print("---------------------------");
			print("ADD/REM \n")
			print("1 - Adicionar Tarefas \n");
			print("2 - Remover Tarefas \n");
			print("---------------------------");
			print("ALTERAR \n");
			print("3 - Concluir Tarefa \n");
			print("4 - Retornar Tarefa \n")
			print("---------------------------");
			print("VISUALIZAR \n")
			print("5 - Visualizar Tarefas Pendentes \n")
			print("6 - Visualizar Tarefas Concluidas \n");
			print("--------------------------- \n");
			print("0 - Sair \n");
			print("Selecione: ");

			escolha = readLine()

			if(escolha == "1")
			{
				Add();

			}
			else if(escolha == "2")
			{
				Rem();

			}
			else if(escolha == "3")
			{
				ConcluirTarefa();

			}
			else if(escolha == "4")
			{
				RetornarTarefa();

			}
			else if(escolha == "5")
			{
				VisualizaPendente();

			}
			else if(escolha == "6")
			{
				VisualizaFinalizada();

			}
			else if(escolha == "0")
			{
				break;

			}
			else
			{
				print("Valor invalido!!!");
				_ = readLine();

			}

		}

	}

	// Adicionar novas tarefas ao sistema
	mutating func Add() -> Void
	{
		system("clear");

		print("ADICIONAR TAREFA \n");
		print("Titulo:")
		titulo = readLine();
		print("Descricao:");
		descricao = readLine();

		tf.Adiciona(titulo: titulo!, descricao: descricao!);

		print("\n");

		_ = readLine();

	}

	// Finaliza uma tarefa especifica
	mutating func ConcluirTarefa() -> Void
	{
		system("clear");

		print("CONCLUIR TAREFA \n");
		tf.Finalizar();

		_ = readLine();

	}

	// Moficia o stauts de uma tarefa de concluida para pendente
	mutating func RetornarTarefa() -> Void
	{
		system("clear");

		print("RETORNAR TAREFA \n");
		tf.Finalizado();
		tf.Retornar();

		_ = readLine();

	}

	// Remove uma tarefa especifica
	mutating func Rem()
	{
		system("clear");

		print("REMOVER TAREFA\n");
		tf.Pendente();
		print("\n");
		print("Remover:");
		titulo = readLine();

		tf.Remove(titulo: titulo!);
		
	}

	// Visualiza tarefas pendentes
	func VisualizaPendente() -> Void
	{
		system("clear");

		print("TAREFAS PENDENTES \n");

		tf.Pendente();

		print("Pressione ENTER para voltar");

		_ = readLine();

	}

	// Visualiza tarefas finalizadas
	func VisualizaFinalizada() -> Void
	{
		system("clear");

		print("TAREFAS FINALIZADAS \n");

		tf.Finalizado();

		print("Pressione ENTER para voltar");

		_ = readLine();
		
	}

}

// Inicio
// Ponto de execucao dos processos
var main: Menu;

main = Menu();

main.Principal();











