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
 * @author Pietro
 */
public class PertenceData {
    public void incluir(PertenceDO pertence, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into pertence (microEventoId, macroEventoId) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pertence.getMicroId());
        ps.setInt(2, pertence.getMacroId());
     
        int result = ps.executeUpdate();
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        pertence.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(PertenceDO pertence, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
            String sql = "delete from pertence where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pertence.getId());
        int result = ps.executeUpdate();
    } // excluir
    
    public void excluirPorMacro(int macroId, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
            String sql = "delete from pertence where macroEventoId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, macroId);
        int result = ps.executeUpdate();
    }
    
    public void excluirPorMicro(int microId, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
            String sql = "delete from pertence where microEventoId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, microId);
        int result = ps.executeUpdate();
    }
    
    public List<Integer> buscarMicroPorMacro(EventoDO macroEvento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from pertence where macroEventoId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, macroEvento.getId());
        ResultSet rs = ps.executeQuery();
        List<Integer> itens=new ArrayList<Integer>();
        while (rs.next()) {
            itens.add(rs.getInt("microEventoId"));
        }
        return itens;
    } // buscar
    
    public void atualizar(PertenceDO pertence, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update pertence set macroEventoId=?, microEventoId = ? where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pertence.getMacroId());
        ps.setInt(2, pertence.getMicroId());
        ps.setInt(3, pertence.getId());
        int result = ps.executeUpdate(); 
    }
    
    public PertenceDO buscar(int microID, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from pertence where microEventoId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, microID);
        ResultSet rs = ps.executeQuery();
        PertenceDO pertence = new PertenceDO();
        rs.first();
        pertence.setId(rs.getInt("id"));
        pertence.setMacroId(rs.getInt("macroEventoId"));
        pertence.setMicroId(rs.getInt("microEventoId"));
        return pertence;
    } 
}
