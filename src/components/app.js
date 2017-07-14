/**
 * Created by Wilterson Garcia on 13/07/2017.
 */

import React from 'react';
import AddTodo from './add-todo';
import TodosList from './todos-list';
import {Button, Icons, Tabs, Tab} from 'react-materialize'

//Tasks predefinidas
const todos = [
    {
        task: 'Lavar o Carro',
        isComplete: true
    },
    {
        task: 'Comprar Comida',
        isComplete: false
    },
    {
        task: 'Cozinhar',
        isComplete: false
    }
];

export default class App extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            todos
        }
    }

    render() {
        const mainStyle = {
            padding: '50px 120px',
            fontFamily: 'Open Sans'
        };

        const appTitletyle = {
            textTransform: 'uppercase',
            fontFamily: 'Open Sans'
        };

        return (
            <div style={mainStyle}>
                <h1 className="center-align" style={appTitletyle}>ToDo List React</h1>

                <Tabs className='tabs-fixed-width'>
                    <Tab title="pendentes" active>
                        <AddTodo todos={this.state.todos} createTask={this.createTask.bind(this)}/>

                        <TodosList
                            todos={this.getPending()}
                            toggleTask={this.toggleTask.bind(this)}
                            saveTask={this.saveTask.bind(this)}
                            deleteTask={this.deleteTask.bind(this)}
                        />
                    </Tab>
                    <Tab title="concluidas">
                        <TodosList
                            todos={this.getDone()}
                            toggleTask={this.toggleTask.bind(this)}
                            saveTask={this.saveTask.bind(this)}
                            deleteTask={this.deleteTask.bind(this)}
                        />
                    </Tab>
                </Tabs>
            </div>
        );
    }

    /**
     * Conclui/Desfaz uma task
     * */
    toggleTask(task) {
        const foundTodo = _.find(this.state.todos, todo => todo.task === task);
        foundTodo.isComplete = !foundTodo.isComplete;
        this.setState({todos: this.state.todos});
    }

    /**
     * Add uma nova task
     * */
    createTask(task) {
        this.state.todos.push({
            task,
            isComplete: false
        });

        this.setState({ todos: this.state.todos });
    }

    /**
     * Salva a task que foi editada
     * */
    saveTask(oldTask, newTask) {
        const foundTodo = _.find(this.state.todos, todo => todo.task === oldTask);
        foundTodo.task = newTask;
        this.setState({todos: this.state.todos});
    }

    /**
     * Deleta uma task
     * */
    deleteTask(taskToDelete){
        let tasks = this.state.todos;
        let app = this;

        swal({
            title: 'Tem Certeza?',
            text: "Essa ação não poderá ser revertida!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#26a69a',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Deletar',
            cancelButtonText: 'Cancelar',
        }).then(function () {
            _.remove(tasks, todo => todo.task === taskToDelete);
            app.setState({ todos: tasks });

            swal(
                'Deletado!',
                'Tarefa deletada com sucesso.',
                'success'
            )
        });
    }

    /**
     * Retorna somente as tasks já concluidas
     * */
    getDone(){
        const done = [];
        _.forEach(this.state.todos, function (value){
            if(value.isComplete){
                done.push(value);
            }
        });
        return done;
    }

    /**
     * Retorna somente as tasks pendentes
     * */
    getPending(){
        const pending = [];
        _.forEach(this.state.todos, function (value){
            if(!value.isComplete){
                pending.push(value);
            }
        });
        return pending;
    }


}