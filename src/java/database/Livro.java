package database;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;


public class Livro {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String titulo;
    
    public void setConexao(Connection con) {
        this.con = con;
    }    

public boolean inserir(int id_livro, String titulo, String autor, int ano, double preco, String foto, int id_editora) {
    try {
        
            ps = con.prepareStatement("INSERT INTO livro VALUES (?, ?, ?, ?, ?, ?, ?)");
            
            ps.setString(1, titulo);
            ps.setString(2, autor);
            ps.setInt(3, ano);
            ps.setDouble(4, preco);
            ps.setString(5, foto);
            ps.setInt(6, id_editora);
            ps.setInt(7, id_livro);
            ps.executeUpdate();
            return true; // livro foi registrado
        
    } catch (Exception e) {
        e.printStackTrace();
        return false; // erro ao inserir
    }    
}
public boolean atualizar(String titulo, String autor, int ano, double preco, String foto, int id_editora, int id_livro) {
     try {
        ps = con.prepareStatement("UPDATE livro " +
                                "SET titulo = ?, " +
                                "SET autor = ?, " +
                                "SET ano = ?, " +
                                "SET preco = ?, " +
                                "SET foto = ?, " +
                                "SET id_editora = ? " +
                                "WHERE (id_livro = ?)");        
        ps.setString(1, titulo);
        ps.setString(2, autor);
        ps.setInt(3, ano);
        ps.setDouble(4, preco);
        ps.setString(5, foto);
        ps.setInt(6, id_editora);
        ps.setInt(7, id_livro);
        ps.executeUpdate();
            
        return true;
    }
          
     catch (Exception e) {
         e.printStackTrace();
         return false;
    }
}
public ResultSet listar(){
    try {
        ps = con.prepareStatement("SELECT * FROM livro");
        rs = ps.executeQuery();
        return rs;
        
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    } 
}
public ResultSet pesquisar(String titulo){
    try {
        ps = con.prepareStatement("SELECT * FROM livro WHERE titulo LIKE ?");
        ps.setString(1, "%" + titulo + "%");
        rs = ps.executeQuery();
        return rs;
        
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    } 
}
  
}
    
