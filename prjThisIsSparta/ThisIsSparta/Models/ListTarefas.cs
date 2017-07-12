using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ThisIsSparta.Models
{
    public class ListTarefas : List<Tarefa>
    {
        private static ListTarefas instance;

        private ListTarefas() { }

        public static ListTarefas Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ListTarefas();
                    instance.Add(new Tarefa { StatusTarefa = 1, TextTarefa = "Adicionando tarefas" });
                }
                return instance;
            }
        }
    }
}
