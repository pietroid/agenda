/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
/*
 *
 * @author Convidado
 */
public class ComentarioData {
    
    public void incluir(ComentarioDO comentario, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into comentario (EVEid,USUid,mensagem) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);      
        ps.setInt(1, comentario.getEveId());
        ps.setInt(2, comentario.getUsuId());
        ps.setString(3,comentario.getMensagem());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        comentario.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(ComentarioDO comentario, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from comentario where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, comentario.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(ComentarioDO comentario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update comentario set EVEid=?, USUid=?, mensagem=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, comentario.getEveId());
     ps.setInt(2, comentario.getUsuId());
     ps.setString(3,comentario.getMensagem());
     ps.setInt(4, comentario.getId());
     int result = ps.executeUpdate(); 
    } // atualizar

    public ComentarioDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from comentario where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        ComentarioDO comentario = new ComentarioDO();
        comentario.setId(rs.getInt("id"));
        comentario.setEveId(rs.getInt("EVEid"));
        comentario.setUsuId(rs.getInt("USUid"));
        comentario.setMensagem(rs.getString("mensagem"));
        return comentario;
    } // buscar

    public List<ComentarioDO> buscarPorEVEid(int EVEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from comentario where eveid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, EVEid);
        ResultSet rs = ps.executeQuery();
        List<ComentarioDO> comentarios = new ArrayList<ComentarioDO>();
        while(rs.next()){
            ComentarioDO comentario = new ComentarioDO();
            comentario.setId(rs.getInt("id"));
            comentario.setEveId(rs.getInt("eveid"));
            comentario.setUsuId(rs.getInt("usuid"));
            comentario.setMensagem(rs.getString("mensagem"));
            comentarios.add(comentario);
        }
        return comentarios;
    }
}
