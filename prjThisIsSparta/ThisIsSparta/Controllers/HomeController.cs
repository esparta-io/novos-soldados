using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ThisIsSparta.Models;

namespace ThisIsSparta.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(string textadd)
        {
            Tarefa t = new Tarefa();
            t.TextTarefa = textadd;
            t.StatusTarefa = 0;
            ListTarefas.Instance.Add(t);

            return View("index");
        }

        [HttpPost]
        public IActionResult MoveE(string text)
        {
            Tarefa temp = RemoveTarefa(text);
            temp.StatusTarefa -= 1;
            ListTarefas.Instance.Add(temp);

            return View("index");
        }

        [HttpPost]
        public IActionResult MoveD(string text)
        {
            Tarefa temp = RemoveTarefa(text);
            temp.StatusTarefa += 1;
            ListTarefas.Instance.Add(temp);

            return View("index");
        }

        public IActionResult Del(string text)
        {
            RemoveTarefa(text);

            return View("index");
        }

        public IActionResult Error()
        {
            return View();
        }

        private Tarefa RemoveTarefa(string txt)
        {
            Tarefa tarefa = new Tarefa();
            foreach (Tarefa t in ListTarefas.Instance)
            {
                if (txt == t.TextTarefa)
                {
                    tarefa = t;
                }
            }
            ListTarefas.Instance.Remove(tarefa);
            return tarefa;
        }
    }
}
