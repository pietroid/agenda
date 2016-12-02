package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {

    public UsuarioDO buscar(String username, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Usuario where Username = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        UsuarioDO usuario = null;
        if (rs.next()) {
            usuario = new UsuarioDO();
            usuario.setUsername(rs.getString("Username"));
            usuario.setSenha(rs.getString("Senha"));
            usuario.setId(rs.getInt("USUid"));
            usuario.setNome(rs.getString("USnome"));
            usuario.setEmail(rs.getString("E-mail"));
            usuario.setBio(rs.getString("USbio"));
            usuario.setImagem(rs.getString("USimagem"));
            usuario.setData(rs.getDate("USdata"));
            usuario.setCurso(rs.getString("UScurso"));
            usuario.setIngresso(rs.getDate("USingresso"));
            usuario.setPasta(rs.getString("USpasta"));
        }
  
        return usuario;
    }
}
