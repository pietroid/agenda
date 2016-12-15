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
        Connection con = tr.obterConexao(); // conexão com o bd
        String sql = "insert into agenda.POI (nome,descrição,endereço,link_para_maps,pasta_de_imagens) values (?,?,?,?,?)"; //
        PreparedStatement ps = con.prepareStatement(sql); // 
        ps.setString(1, PontoDeInteresse.getNome()); //set no bd dos valores obtidos no objeto POI
        ps.setString(2, PontoDeInteresse.getDescricao());
        ps.setString(3, PontoDeInteresse.getEndereco());
        ps.setString(4, PontoDeInteresse.getLink_para_maps());
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
        String[] sql = {"delete from agenda.POI where POI_id = ?",
                "delete from QG where POI_id = ?"};
        PreparedStatement ps = con.prepareStatement(sql[0]);
        ps.setInt(1, PontoDeInteresse.getId());
        ps.execute();
        ps = con.prepareStatement(sql[1]);
        ps.setInt(1, PontoDeInteresse.getId());
        ps.execute();
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
        PontoDeInteresse.setDescricao(rs.getString("descrição"));
        PontoDeInteresse.setEndereco(rs.getString("endereço"));
        PontoDeInteresse.setLink_para_maps(rs.getString("link_para_maps"));
        PontoDeInteresse.setPasta_de_imagens(rs.getString("pasta_de_imagens"));
        return PontoDeInteresse;
    } // buscar por Id
    
    public PontoDeInteresseDO buscarnome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.POI where nome = '?' ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        rs.first();
        PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
        PontoDeInteresse.setId(rs.getInt("POI_id"));
        PontoDeInteresse.setNome(rs.getString("nome"));
        PontoDeInteresse.setDescricao(rs.getString("descrição"));
        PontoDeInteresse.setEndereco(rs.getString("endereço"));
        PontoDeInteresse.setLink_para_maps(rs.getString("link_para_maps"));
        PontoDeInteresse.setPasta_de_imagens(rs.getString("pasta_de_imagens"));
        return PontoDeInteresse;
    } // buscar por nome
        
    public void atualizar(PontoDeInteresseDO PontoDeInteresse, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update agenda.POI set nome=?, descrição=?,endereço=?,link_para_maps=?,pasta_de_imagens=? where POI_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, PontoDeInteresse.getNome());
        ps.setString(2, PontoDeInteresse.getDescricao());
        ps.setString(3, PontoDeInteresse.getEndereco());
        ps.setString(4, PontoDeInteresse.getLink_para_maps());
        ps.setString(5, PontoDeInteresse.getPasta_de_imagens());
        ps.setInt(6, PontoDeInteresse.getId());
        int result = ps.executeUpdate(); 
    } // atualizar
    
    public List<PontoDeInteresseDO> ListarPOI(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from POI";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<PontoDeInteresseDO> Items = new ArrayList<PontoDeInteresseDO>();
        while (rs.next()) {
            PontoDeInteresseDO i = new PontoDeInteresseDO();
            i.setId (rs.getInt("POI_id"));
            i.setNome (rs.getString("nome"));
            i.setDescricao(rs.getString("descrição"));
            i.setEndereco(rs.getString("endereço"));
            i.setLink_para_maps(rs.getString("link_para_maps"));
            i.setPasta_de_imagens(rs.getString("pasta_de_imagens"));
            Items.add(i);
        }
        return Items;
    }
        
     
    
}
