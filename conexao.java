package teste;
import java.sql.*;
import java.util.*;

public class conexao {

    private String user = "root";
    private String senha = "326126kk";
    private String link = "jdbc:mysql://127.0.0.1:3306/tarefas?autoReconnect=true&useSSL=false";
    private String driver = "com.mysql.jdbc.Driver";
    public Connection conn;
    	// Conectar ao banco
    	public  Connection conectar() throws Exception {
    		// Registrar o driver
    		Class.forName(driver);
    		// Capturar a conex�o
    		conn = DriverManager.getConnection(link, user, senha);
    		// Retorna a conexao aberta
      
        
    		//Testa sua conex�o//  
            
    		if (conn != null) {

    			System.out.println("STATUS--->Conectado com sucesso!");

    		} else {

    			System.out.println("STATUS--->N�o foi possivel realizar conex�o");

    		}
    		
    		return conn;


    	}
    	
    	
    	
    	
}
