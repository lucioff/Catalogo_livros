package database;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class Usuario {
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String nome_usuario;
    
    public void setConexao(Connection con) {
        this.con = con;
    }    

public boolean usuarioExiste(String nome_usuario) {
    int qtde;
    try {
        ps = con.prepareStatement("SELECT COUNT(*) as qtde FROM usuario " + 
                "WHERE nome_usuario = ?");
        ps.setString(1, nome_usuario);
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
}
public int inserir(int id_usuario, String nome_usuario, String senha) {
    try {
        if (usuarioExiste(nome_usuario))
            return 1; //usuario existe
        else
            ps = con.prepareStatement("INSERT INTO usuario VALUES (?, ?, ?)");
            ps.setInt(1, id_usuario);
            ps.setString(2, nome_usuario);
            ps.setString(3, senha);
            ps.executeUpdate();
            return 0; // usuario foi registrado
        
    } catch (Exception e) {
        e.printStackTrace();
        return -1; // erro ao inserir
    }    
}
public int autenticar(String nome_usuario, String senha) {
    int qtde;
    try {
        ps = con.prepareStatement("SELECT nome_usuario, COUNT(*) as qtde FROM usuario " +
                "WHERE nome_usuario = ? and senha = ?");
        ps.setString(1, nome_usuario);
        ps.setString(2, senha);
        rs = ps.executeQuery();
        rs.next();
        qtde = rs.getInt("qtde");
        
        if (qtde == 1) {
            this.nome_usuario = rs.getString("nome_usuario");
        } 
        return qtde;
    }
          
     catch (Exception e) {
         e.printStackTrace();
         return -1;
    }
}
public String getUsuario(){
    return nome_usuario;
}

}