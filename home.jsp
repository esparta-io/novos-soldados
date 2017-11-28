<%@ page language="java" import="teste.conexao,java.sql.*,java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Controle de terefas</title>
</head>
<body>

<script>
	function redirecionar() {
	    
		if (confirm("Deseja realizar a exclusão da tarefa ?") == true) {
		    alert("Tarefa excluída!");
		} else {
			window.location.reload();
		}
	    
	}
</script>
	
	<h1>Controle de Tarefas</h1>
<br>
<br>
<%
	String titulo="",descricao="",data="",hora_ini="",hora_fim="";
	int id_tarefa=0;

	String titulo1="",descricao1="",data1="",hora_ini1="",hora_fim1="";
	int id_tarefa1=0;
	
	conexao banco=new conexao();
	banco.conectar();

%>

	<a href="registro_tarefa.jsp">Nova Tarefa</a>
	<br>
	<br>
	<h3>Tarefas Pendentes</h3>

<%
	
	
	String sql="Select id_tarefa,descricao,titulo,data,hora_ini,hora_fim from tarefa where status='Pendente' order by data desc";
	
	PreparedStatement stmt= banco.conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
		
		id_tarefa=(rs.getInt("id_tarefa"));
		descricao=(rs.getString("descricao"));
		titulo=(rs.getString("titulo"));
		data=(rs.getString("data"));
		hora_ini=(rs.getString("hora_ini"));
		hora_fim=(rs.getString("hora_fim"));
		out.println(id_tarefa+"."+titulo+"<br>");
		out.println("Dia:"+data+" das "+hora_ini+"as "+hora_fim+"<br>");
		out.println(descricao+"<br>");
		String redirect_finaliza="finalizar.jsp?id_tarefa="+id_tarefa;
		String redirect_exclui="excluir.jsp?id_tarefa="+id_tarefa;
%>
	
	
	<br>
	
	<input type="button" name="finalizar"  onclick="document.location.href='<%= redirect_finaliza %>'" value="Finalizar tarefa">	
	
	
	<input type="button" name="excluir_tarefa"  onclick="document.location.href='<%= redirect_exclui %>',redirecionar();" value="Excluir tarefa">
	<br><br>
	------------------------------
	<%
		
	}
	
	
	
	

	%>
<br>
<br>
<h3>Tarefas conclúidas</h3>

<%

String sql1="Select id_tarefa,descricao,titulo,data,hora_ini,hora_fim from tarefa where status='Encerrado'";

PreparedStatement stmt1= banco.conn.prepareStatement(sql1);
ResultSet rs1 = stmt1.executeQuery();
while(rs1.next()){
	
	id_tarefa1=(rs1.getInt("id_tarefa"));
	descricao1=(rs1.getString("descricao"));
	titulo1=(rs1.getString("titulo"));
	data1=(rs1.getString("data"));
	hora_ini1=(rs1.getString("hora_ini"));
	hora_fim1=(rs1.getString("hora_fim"));
	
	out.println(id_tarefa1+"."+titulo1+"<br>");
	out.println("Dia:"+data1+" das "+hora_ini1+"as "+hora_fim1+"<br>");
	out.println(descricao1+"<br>");
	String redirect_reativa="reativar.jsp?id_tarefa1="+id_tarefa1;
	



	




%>
<input type="button" name="reativa"  onclick="document.location.href='<%= redirect_reativa %>'" value="Reativar tarefa">	
<br>
------------------------------
<br>
<%

}

%>


</body>
</html>