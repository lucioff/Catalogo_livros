package database;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class Editora {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String nome;
    
    public void setConexao(Connection con) {
        this.con = con;
    }    

/*public boolean editoraExiste(String nome) {
    int qtde;
    try {
        ps = con.prepareStatement("SELECT COUNT(*) as qtde FROM editora " + 
                "WHERE nome = ?");
        ps.setString(1, nome);
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
public boolean inserir(String nome, String cidade, int id_editora) {
    try {
            ps = con.prepareStatement("INSERT INTO editora VALUES (?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, cidade);
            ps.setInt(3, id_editora);            
            ps.executeUpdate();
            return true; // usuario foi registrado
        
    } catch (Exception e) {
        e.printStackTrace();
        return false; // erro ao inserir
    }    
}

}
