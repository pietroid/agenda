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
 * @author Alexandre Inoue
 */
public class PreferenciaData {
    public void incluir(PreferenciaDO preferencia, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.preferencia (USERid, GRUPOid) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(2, preferencia.getGEid());
        ps.setInt(1, preferencia.getUSUid());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        preferencia.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(PreferenciaDO preferencia, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.preferencia where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, preferencia.getId());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(PreferenciaDO preferencia, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update agenda.preferencia set GRUPOid = ?, USERid = ? where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, preferencia.getGEid());
        ps.setInt(2, preferencia.getUSUid());
        ps.setInt(3, preferencia.getId());
        int result = ps.executeUpdate();
    } // atualizar

    public PreferenciaDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.preferencia where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        PreferenciaDO preferencia = new PreferenciaDO();
        preferencia.setId(rs.getInt("id"));
        preferencia.setGEid(rs.getInt("GRUPOid"));
        preferencia.setUSUid(rs.getInt("USERid"));
        return preferencia;
    } // buscar
    
    public List<PreferenciaDO> pesquisarPorUser(UsuarioDO user, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.preferencia where USERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, user.getId());
        ResultSet rs = ps.executeQuery();
        List<PreferenciaDO> Items = new ArrayList<PreferenciaDO>();
        while (rs.next()) {
            PreferenciaDO i = new PreferenciaDO();
            i.setId (rs.getInt("id"));
            i.setGEid (rs.getInt("GRUPOid"));
            i.setUSUid(rs.getInt("USERid"));
            Items.add(i);
        }
        return Items;
    } // pesquisar por GEid
    
    public List<PreferenciaDO> pesquisarPorGEid(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.preferencia where GRUPOid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ResultSet rs = ps.executeQuery();
        List<PreferenciaDO> Items = new ArrayList<PreferenciaDO>();
        while (rs.next()) {
            PreferenciaDO i = new PreferenciaDO();
            i.setId (rs.getInt("id"));
            i.setGEid (rs.getInt("GRUPOid"));
            i.setUSUid(rs.getInt("USERid"));
            Items.add(i);
        }
        return Items;
    }
    
}
