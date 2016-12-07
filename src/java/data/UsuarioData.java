package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {
    public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.Usuario (Username, Senha, USnome, Email, USbio, USimagem, USdata, UScurso, USingresso, USpasta, USuperuser,USpergunta,USresposta) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, usuario.getUsername());
        ps.setString(2, usuario.getSenha());
        ps.setString(3, usuario.getNome());
        ps.setString(4, usuario.getEmail());
        ps.setString(5, usuario.getBio());
        ps.setString(6, usuario.getImagem());
        ps.setDate(7, usuario.getData());
        ps.setString(8, usuario.getCurso());
        ps.setDate(9, usuario.getIngresso());
        ps.setString(10,usuario.getPasta());
        ps.setInt(11, boolToInt(usuario.isSuperUser()));
        ps.setString(12, usuario.getPergunta());
        ps.setString(13, usuario.getResposta());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        usuario.setId(rs.getInt("LAST_INSERT_ID()"));
    }
    
      public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update agenda.Usuario set Username=?, Senha=?, USnome=?, Email=?, USbio=?, USimagem=?, USdata=?, UScurso=?, USingresso=?, USpasta=?, USuperuser=?,USpergunta=?,USresposta=?  where USUid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getUsername());
        ps.setString(2, usuario.getSenha());
        ps.setString(3, usuario.getNome());
        ps.setString(4, usuario.getEmail());
        ps.setString(5, usuario.getBio());
        ps.setString(6, usuario.getImagem());
        ps.setDate(7, usuario.getData());
        ps.setString(8, usuario.getCurso());
        ps.setDate(9, usuario.getIngresso());
        ps.setString(10,usuario.getPasta());
        ps.setInt(11, boolToInt(usuario.isSuperUser()));
        ps.setString(12, usuario.getPergunta());
        ps.setString(13, usuario.getResposta());
        ps.setInt(14, usuario.getId());
     
     int result = ps.executeUpdate(); 
    } // atualizar
      
      
    public UsuarioDO buscar(String username, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Usuario where Username = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        UsuarioDO usuario = null;
        rs.first();
        usuario = new UsuarioDO();    
        usuario.setUsername(rs.getString("Username"));
        usuario.setSenha(rs.getString("Senha"));
        usuario.setId(rs.getInt("USUid"));
        usuario.setNome(rs.getString("USnome"));
        usuario.setEmail(rs.getString("Email"));
        usuario.setBio(rs.getString("USbio"));
        usuario.setImagem(rs.getString("USimagem"));
        usuario.setData(rs.getDate("USdata"));
        usuario.setCurso(rs.getString("UScurso"));
        usuario.setIngresso(rs.getDate("USingresso"));
        usuario.setPasta(rs.getString("USpasta"));
        usuario.setSuperUser(rs.getInt("USuperuser")==1);
        usuario.setPergunta(rs.getString("USpergunta"));
        usuario.setResposta(rs.getString("USresposta"));
  
        return usuario;
    }
    public void excluir(UsuarioDO usuario, Transacao tr) throws Exception {
        int id = usuario.getId();
        Connection con = tr.obterConexao();
        String sql = "delete * from agenda.Usuario where USUid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.first();
    };
    private int boolToInt(boolean value){
        if(value){
            return 1;
        }else{
            return 0;
        }
    }
    public UsuarioDO buscarID(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Usuario where USUid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        UsuarioDO usuario = new UsuarioDO();    
        usuario.setUsername(rs.getString("Username"));
        usuario.setSenha(rs.getString("Senha"));
        usuario.setId(rs.getInt("USUid"));
        usuario.setNome(rs.getString("USnome"));
        usuario.setEmail(rs.getString("Email"));
        usuario.setBio(rs.getString("USbio"));
        usuario.setImagem(rs.getString("USimagem"));
        usuario.setData(rs.getDate("USdata"));
        usuario.setCurso(rs.getString("UScurso"));
        usuario.setIngresso(rs.getDate("USingresso"));
        usuario.setPasta(rs.getString("USpasta"));
        usuario.setSuperUser(rs.getInt("USuperuser")==1);
        usuario.setPergunta(rs.getString("USpergunta"));
        usuario.setResposta(rs.getString("USresposta"));
        return usuario;
    }    
    
    
    
    
    
    
}
