package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConexaoBd {
    
    Connection con;
    public boolean conectar() {
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/livros?user=root&password=root&useSSL=false";
            con = DriverManager.getConnection(url);
            System.err.println("conectado com sucesso");
            return true;
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.err.println("erro na conexao");
            return false;
        }
    }
   
    public void fechar() {
        try {
            con.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    public Connection getConexao(){
        return con;
    }  
}




