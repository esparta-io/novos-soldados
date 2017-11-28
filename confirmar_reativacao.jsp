<%@ page language="java" import="teste.conexao, java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String titulo="",data="",hora_ini="",hora_fim="",descricao="";

titulo=request.getParameter("titulo");
data=request.getParameter("data");
hora_ini=request.getParameter("hora_ini");
hora_fim=request.getParameter("hora_fim");
descricao=request.getParameter("descricao");

String alterar="update tarefa set titulo='"+titulo+"',data='"+data+"',hora_ini='"+hora_ini+"',hora_fim='"+hora_fim+"',descricao='"+descricao+"',status='Pendente' where id_tarefa="+request.getParameter("id_tarefa");
conexao banco=new conexao();
banco.conectar();


PreparedStatement stmt= banco.conn.prepareStatement(alterar);
stmt.executeUpdate();
stmt.close();
banco.conn.close();

out.print("<script>alert('Tarefa reativada');<script/>");
response.sendRedirect("home.jsp");	

%>
</body>
</html>