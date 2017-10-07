<%@ page language="java" import="teste.conexao,java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reativar tarefa</title>
</head>
<body>
<h1>Reativação de Tarefa</h1>
	<br>
	
<%


String titulo1="",descricao1="",data1="",hora_ini1="",hora_fim1="";
int id_tarefa1=0;
conexao banco=new conexao();
banco.conectar();


String sql1="Select id_tarefa,descricao,titulo,data,hora_ini,hora_fim from tarefa where status='Encerrado' and id_tarefa="+
request.getParameter("id_tarefa1");

PreparedStatement stmt1= banco.conn.prepareStatement(sql1);
ResultSet rs1 = stmt1.executeQuery();
while(rs1.next()){
	
	id_tarefa1=(rs1.getInt("id_tarefa"));
	descricao1=(rs1.getString("descricao"));
	titulo1=(rs1.getString("titulo"));
	data1=(rs1.getString("data"));
	hora_ini1=(rs1.getString("hora_ini"));
	hora_fim1=(rs1.getString("hora_fim"));
	
	String redirect_reativa="reativar.jsp?id_tarefa1="+id_tarefa1;


%>	
	
	<form action="confirmar_reativacao.jsp">
	
		Titulo de tarefa:
		<input type="text" id="titulo" value="<%=titulo1 %>" name="titulo" placeholder="Titulo da tarefa" required>
		<br>
		<br>
		<INPUT TYPE="hidden" NAME="id_tarefa" value="<%=id_tarefa1 %>">
		Data
		<input type="date" id="data"  value="<%=data1 %>" name="data" required>
		<br><br>
		Horário Inicial
		<input type="time" id="hora_ini" value="<%=hora_ini1 %>" name="hora_ini" required>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		
		Horário final
		<input type="time" id="hora_fim" value="<%=hora_fim1 %>" name="hora_fim" required>
		
		<br>
		<br>
		
		Descrição:
		<br><br>
		<textarea rows="4" cols="50" name="descricao"  required><%=descricao1 %> </textarea>
		<br>
		<br>
		
		<input type="submit" id="alterar" value="Reativar Tarefa">
	
	</form>
	
	<br>
	<br>
	<%
	}

		
	%>
	<a href="home.jsp">Voltar</a>
</body>
</html>