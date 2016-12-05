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
 * @author Lucas Freitas
 */
public class PontoDeInteresseData {
    
    public void incluir(PontoDeInteresseDO  PontoDeInteresse, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.POI (nome,descrição,endereço,link_para_maps,pasta_de_imagens) values (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, PontoDeInteresse.getNome());
        ps.setString(2, PontoDeInteresse.getDescrição());
        ps.setString(3, PontoDeInteresse.getEndereço());
        ps.setString(4,PontoDeInteresse.getLink_para_maps());
        ps.setString(5, PontoDeInteresse.getPasta_de_imagens());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        PontoDeInteresse.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(PontoDeInteresseDO  PontoDeInteresse, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.POI where POI_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, PontoDeInteresse.getId());
        int result = ps.executeUpdate();
    } // excluir

    public PontoDeInteresseDO buscar(int POI_id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.POI where POI_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, POI_id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
        PontoDeInteresse.setId(rs.getInt("POI_id"));
        PontoDeInteresse.setNome(rs.getString("nome"));
        PontoDeInteresse.setDescrição(rs.getString("descrição"));
        PontoDeInteresse.setEndereço(rs.getString("endereço"));
        PontoDeInteresse.setLink_para_maps(rs.getString("link_para_maps"));
        PontoDeInteresse.setPasta_de_imagens(rs.getString("pasta_de_imagens"));
        return PontoDeInteresse;
    } // buscar
    public void atualizar(PontoDeInteresseDO PontoDeInteresse, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update agenda.POI set nome=?, descrição=?,endereço=?,link_para_maps=?,pasta_de_imagens=? where POI_id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, PontoDeInteresse.getNome());
     ps.setString(2, PontoDeInteresse.getDescrição());
     ps.setString(3, PontoDeInteresse.getEndereço());
     ps.setString(4, PontoDeInteresse.getLink_para_maps());
     ps.setString(5, PontoDeInteresse.getPasta_de_imagens());
     
     int result = ps.executeUpdate(); 
    } // atualizar
     
    
}
