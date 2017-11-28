<%@ page language="java" import="teste.criar_tarefa" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nova Tarefa</title>
</head>
<body>
<h1>Nova Tarefa</h1>
	<br>
	
	<form action="">
	
		Titulo de tarefa:
		<input type="text" id="titulo" name="titulo" placeholder="Titulo da tarefa" required>
		<br>
		<br>
		
		Data
		<input type="date" id="data" name="data" required>
		<br><br>
		Horário Inicial
		<input type="time" id="hora_ini" name="hora_ini" required>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		
		Horário final
		<input type="time" id="hora_fim" name="hora_fim" required>
		
		<br>
		<br>
		
		Descrição:
		<br><br>
		<textarea rows="4" cols="50" name="descricao" required> </textarea>
		<br>
		<br>
		
		<input type="submit" id="criar" value="Criar">
	
	</form>
	
	<br>
	<br>
	
	
	<%
	
	String titulo=request.getParameter("titulo");
	String data=request.getParameter("data");
	String hora_ini=request.getParameter("hora_ini");
	String hora_fim=request.getParameter("hora_fim");
	String descricao=request.getParameter("descricao");
	
	
	
	criar_tarefa registrar=new criar_tarefa();
	
	registrar.get_dados(titulo,descricao,data,hora_ini,hora_fim);

	
	
	%>
<a href="home.jsp">Voltar</a>
	
</body>
</html>