package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {
    public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into usuario (Username, Senha, USnome, E-mail, USbio, USimagem, USdata, UScurso, USingresso, USpasta, USuperuser) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, usuario.getUsername());
        ps.setString(2, usuario.getSenha());
        ps.setString(3, usuario.getNome());
        ps.setString(4, usuario.getEmail());
        ps.setString(5, usuario.getBio());
        ps.setString(6,usuario.getImagem());
        ps.setDate(7, usuario.getData());
        ps.setString(8, usuario.getCurso());
        ps.setDate(9, usuario.getIngresso());
        ps.setString(10,usuario.getPasta());
        ps.setInt(11, boolToInt(usuario.isSuperUser()));
        int result = ps.executeUpdate();
    }
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
            usuario.setSuperUser(rs.getInt("USuperuser")==1);
            usuario.setPergunta(rs.getString("PerguntaDeSegurança"));
            usuario.setResposta(rs.getString("Resposta"));
        }
  
        return usuario;
    }
    private int boolToInt(boolean value){
        if(value){
            return 1;
        }else{
            return 0;
        }
    }
}
