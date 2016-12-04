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
}