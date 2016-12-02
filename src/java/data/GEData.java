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
        String sql = "insert into agenda.GE (id,nome,descricao,ano,site,face,email,imagem,local,tel,tipo) values (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GE.getId());
        ps.setString(2, GE.getNome());
        ps.setString(3, GE.getDescricao());
        ps.setDate(4, GE.getAno());
        ps.setString(5,GE.getSite());
        ps.setString(6, GE.getFace());
        ps.setString(7, GE.getEmail());
        ps.setString(8, GE.getImagem());
        ps.setString(9, GE.getLocal());
        ps.setInt(10, GE.getTel());
        ps.setString(11, GE.getTipo());
        
        
        
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(GEDO GE, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.GE where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GE.getId());
        int result = ps.executeUpdate();
    } // excluir

    public GEDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.GE where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        GEDO GE = new GEDO();
        GE.setId(rs.getInt("id"));
        GE.setNome(rs.getString("nome"));
        GE.setDescricao(rs.getString("descricao"));
        GE.setAno(rs.getDate("ano"));
        GE.setSite(rs.getString("site"));
        GE.setFace(rs.getString("face"));
        GE.setEmail(rs.getString("email"));
        GE.setImagem(rs.getString("imagem"));
        GE.setLocal(rs.getString("local"));
        GE.setTel(rs.getInt("tel"));
        GE.setTipo(rs.getString("tipo"));
        return GE;
    } // buscar
}