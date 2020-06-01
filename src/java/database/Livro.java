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

/*public boolean livroExiste(String nome_usuario) {
    int qtde;
    try {
        ps = con.prepareStatement("SELECT COUNT(*) as qtde FROM livro " + 
                "WHERE titulo = ?");
        ps.setString(1, titulo);
        rs = ps.executeQuery();
        rs.next();
        qtde = rs.getInt("qtde");
        if (qtde == 0)
            return false;
        else
            return true;
        
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}*/
public boolean inserir(int id_livro, String titulo, String autor, int ano, double preco, String foto, int id_editora) {
    try {
        
            ps = con.prepareStatement("INSERT INTO livro VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, id_livro);
            ps.setString(2, titulo);
            ps.setString(3, autor);
            ps.setInt(4, ano);
            ps.setDouble(5, preco);
            ps.setString(6, foto);
            ps.setInt(7, id_editora);
            ps.executeUpdate();
            return true; // livro foi registrado
        
    } catch (Exception e) {
        e.printStackTrace();
        return false; // erro ao inserir
    }    
}
public boolean atualizar(int id_livro, String titulo, String autor, int ano, double preco, String foto, int id_editora) {
     try {
        ps = con.prepareStatement("UPDATE livro" +
                "SET id_livro = ?" +
                "SET titulo = ?," +
                "SET autor = ?," +
                "SET ano = ?," +
                "SET preco = ?," +
                "SET foto = ?," +
                "SET id_editora = ?,");
        ps.setInt(1, id_livro);
        ps.setString(2, titulo);
        ps.setString(3, autor);
        ps.setInt(4, ano);
        ps.setDouble(5, preco);
        ps.setString(6, foto);
        ps.setInt(7, id_editora);
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

   
}
    
