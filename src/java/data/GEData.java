/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

/**
 *
 * @author Marcus
 */
public class GEData {
    
    public void incluir(GEDO GE, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.grupodeextensao (GEnome,GEdescricao,GEano_de_inicio,GEsite,GEpagina_do_fb,GEemail,GEpasta_de_imagens,GEtel,GEtipo) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, GE.getNome());
        ps.setString(2, GE.getDescricao());
        ps.setInt(3, GE.getAno());
        ps.setString(4,GE.getSite());
        ps.setString(5, GE.getFace());
        ps.setString(6, GE.getEmail());
        ps.setString(7, GE.getImagem());
        ps.setString(8, GE.getTel());
        ps.setString(9, GE.getTipo());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        GE.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(GEDO GE, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.grupodeextensao where GEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GE.getId());
        int result = ps.executeUpdate();
    } // excluir

    public GEDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.grupodeextensao where GEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        GEDO GE = new GEDO();
        rs.first();
        GE.setId(rs.getInt("GEid"));
        GE.setNome(rs.getString("GEnome"));
        GE.setDescricao(rs.getString("GEdescricao"));
        GE.setAno(rs.getInt("GEano_de_inicio"));
        GE.setSite(rs.getString("GEsite"));
        GE.setFace(rs.getString("GEpagina_do_fb"));
        GE.setEmail(rs.getString("GEemail"));
        GE.setImagem(rs.getString("GEpasta_de_imagens"));
        GE.setTel(rs.getString("GEtel"));
        GE.setTipo(rs.getString("GEtipo"));
        return GE;
    } // buscar
    
     public void atualizar(GEDO GE, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update agenda.grupodeextensao set GEnome=?, GEdescricao=?,GEano_de_inicio=?,GEsite=?,GEpagina_do_fb=?,GEemail=?,GEpasta_de_imagens=?,GEtel=?,GEtipo=? where GEid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, GE.getNome());
     ps.setString(2, GE.getDescricao());
     ps.setInt(3, GE.getAno());
     ps.setString(4, GE.getSite());
     ps.setString(5, GE.getFace());
     ps.setString(6, GE.getEmail());
     ps.setString(7, GE.getImagem());
     ps.setString(8, GE.getTel());
     ps.setString(9, GE.getTipo());
     ps.setInt(10, GE.getId());
     
     int result = ps.executeUpdate(); 
    } // atualizar
     
     
    public List<GEDO> ListarGE(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from grupodeextensao";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<GEDO> Items = new ArrayList<GEDO>();
        while (rs.next()) {
            GEDO i = new GEDO();
           i.setId (rs.getInt("GEid"));
            i.setNome (rs.getString("GEnome"));
            i.setDescricao(rs.getString("GEdescricao"));
            i.setAno(rs.getInt("GEano_de_inicio"));
            i.setSite (rs.getString("GEsite"));
            i.setFace (rs.getString("GEpagina_do_fb"));
            i.setEmail(rs.getString("GEemail"));
            i.setImagem(rs.getString("GEpasta_de_imagens"));            
            i.setTel(rs.getString("GEtel"));              
            i.setTipo(rs.getString("GEtipo"));               
            
            
            Items.add(i);
        }
        return Items;
    } // pesquisar por GEid     
     
     
     
     
     
}
