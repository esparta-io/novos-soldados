<%@ page language="java" import="teste.conexao, java.sql.*"  contentType="text/html;  charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
				
	String alterar="update tarefa set status='Encerrado' where id_tarefa="+request.getParameter("id_tarefa");
	
	conexao banco=new conexao();
	banco.conectar();
	
	out.println(alterar);
	
	PreparedStatement stmt= banco.conn.prepareStatement(alterar);
	stmt.executeUpdate();
	stmt.close();
	banco.conn.close();
	
	response.sendRedirect("home.jsp");		
			
			


%>
</body>
</html>