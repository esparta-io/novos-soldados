function get_todos() {
    var todos = new Array;
    var todos_str = localStorage.getItem('todo');
    if (todos_str !== null) {
        todos = JSON.parse(todos_str);
    }
    return todos;
}

function get_dones() {
    var dones = new Array;
    var dones_str = localStorage.getItem('done');
    if (dones_str !== null) {
        dones = JSON.parse(dones_str);
    }
    return dones;
}

function add() {

    var task = document.getElementById('task').value;
    if (task === "") {
        alert("Você não digitou nada");
    } else {
        var todos = get_todos();
        todos.push(task);
        localStorage.setItem('todo', JSON.stringify(todos));

        show();

        return false;
    }
}

function remove() {
    if (confirm('Voce deseja deletar esta tarefa mesmo?')) {
        var id = this.getAttribute('id');
        var dones = get_dones();
        dones.splice(id, 1);
        localStorage.setItem('done', JSON.stringify(dones));

        show();

        return false;
    } else {

    }
}

function undo() {
    var task = document.getElementById('task').value;
    var id = document.getElementById('id');
    var todos = get_todos();
    var dones = get_dones();
    todos.push(task);
    dones.splice(id, 1);
    localStorage.setItem('todo', JSON.stringify(todos));
    localStorage.setItem('done', JSON.stringify(dones));
    show();
    return false;
}

function done() {
    var task = document.getElementById('task').value;
    var id = document.getElementById('id');
    var todos = get_todos();
    var dones = get_dones();
    dones.push(task);
    todos.splice(id, 1);
    localStorage.setItem('todo', JSON.stringify(todos));
    localStorage.setItem('done', JSON.stringify(dones));

    show();

    return false;
}

function show() {
    var todos = get_todos();
    var dones = get_dones();

    var html = '<ul>';
    for (var i = 0; i < todos.length; i++) {
        html += '<li>' + todos[i] + '<button class="done" id="' + i + '">Feito</button></li>';
    }
    ;
    html += '</ul>';

    var html2 = '<ul>';
    for (var i = 0; i < dones.length; i++) {
        html2 += '<li>' + dones[i] + '<button class="undo" id="' + i + '">Desfazer</button> <button class="remove" id="' + i + '">Deletar</button>';
    }
    ;
    html2 += '</ul>';

    document.getElementById('todos').innerHTML = html;
    document.getElementById('dones').innerHTML = html2;

    var buttons = document.getElementsByClassName('remove');
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('click', remove);
    }
    ;

    var buttons2 = document.getElementsByClassName('done');
    for (var i = 0; i < buttons2.length; i++) {
        buttons2[i].addEventListener('click', done);
    }
    ;
    var buttons3 = document.getElementsByClassName('undo');
    for (var i = 0; i < buttons3.length; i++) {
        buttons3[i].addEventListener('click', undo);
    }
    ;
}

document.getElementById('add').addEventListener('click', add);
show();


