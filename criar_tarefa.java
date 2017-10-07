package teste;
import java.sql.*;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
public class criar_tarefa {
	private String titulo;
	private String descricao;
	private String data;
	private String hora_ini;
	private String hora_fim;
	public String sql;
	
	public void get_dados(String rec_titulo,String rec_descricao,String rec_data,String rec_hora_ini,String rec_hora_fim){
		
		titulo=rec_titulo;
		descricao=rec_descricao;
		data=rec_data;
		hora_ini=rec_hora_ini;
		hora_fim=rec_hora_fim;
	}
	
	public boolean inseri_dados() throws SQLException{
		conexao banco=new conexao();
		sql="INSERT INTO tarefa VALUES(?,?,?,?,?,?,?)";
		
		try {
			banco.conectar();
			PreparedStatement stmt= banco.conn.prepareStatement(sql);
			stmt.setString(1,null);
			stmt.setString(2,titulo);
			stmt.setString(3,descricao);
			stmt.setString(4,data);
			stmt.setString(5,hora_ini);
			stmt.setString(6,hora_fim);
			stmt.setString(7,"Pendente");
			stmt.execute();   
		
            stmt.close(); 
            banco.conn.close();
            return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
		
	}
	
}
