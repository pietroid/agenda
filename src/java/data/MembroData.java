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
public class MembroData {

    public void incluir(MembroDO Membro, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.Membro (GEid, USUid, ADM, Aprovado) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getGEid());
        ps.setInt(2, Membro.getUSUid());
        ps.setInt(3, Membro.getADM());
        ps.setInt(4, Membro.getAprovado());
        int result = ps.executeUpdate();

        sql = "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        Membro.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(MembroDO Membro, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.Membro where MEMBERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getId());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(MembroDO Membro, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update agenda.Membro set GEid = ?, USUid = ?, ADM = ?, Aprovado = ? where MEMBERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getGEid());
        ps.setInt(2, Membro.getUSUid());
        ps.setInt(3, Membro.getADM());
        ps.setInt(4, Membro.getAprovado());
        ps.setInt(5, Membro.getId());
        int result = ps.executeUpdate();
    } // atualizar

    
    
    public MembroDO buscar(int MEMBERid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where MEMBERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, MEMBERid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        MembroDO Membro = new MembroDO();
        Membro.setId(rs.getInt("MEMBERid"));
        Membro.setGEid(rs.getInt("GEid"));
        Membro.setUSUid(rs.getInt("USUid"));
        Membro.setADM(rs.getInt("ADM"));
        Membro.setAprovado(rs.getInt("Aprovado"));
        return Membro;
    } // buscar

    public MembroDO buscarPorUSUid(int USUid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where USUid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, USUid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        MembroDO Membro = new MembroDO();
        Membro.setId(rs.getInt("MEMBERid"));
        Membro.setGEid(rs.getInt("GEid"));
        Membro.setUSUid(rs.getInt("USUid"));
        Membro.setADM(rs.getInt("ADM"));
        Membro.setAprovado(rs.getInt("Aprovado"));
        return Membro;
    }
    
    public List<MembroDO> buscarPorUSU_N_Aprv(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ? and Aprovado = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ps.setInt(2, 0);
        ResultSet rs = ps.executeQuery();
        rs.first();
        List<MembroDO> Items = new ArrayList<MembroDO>();
        do{
            MembroDO i = new MembroDO();
            i.setId (rs.getInt("MEMBERid"));
            i.setGEid (rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            i.setAprovado(rs.getInt("Aprovado"));
            Items.add(i);
        }while (rs.next());
        return Items;
    }
    
    public boolean isADM(int GEid, int USUid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ? and USUid = ? and Aprovado = '1'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ps.setInt(2, USUid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        if (rs.getInt("ADM") == 1) {
            return true;
        }
        return false;
    }
    
    public boolean isMembro(int GEid, int USUid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ? and USUid = ? and Aprovado = '1'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ps.setInt(2, USUid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        if (rs.next()) {
            return true;
        }
        return false;
    }    

    public List<MembroDO> pesquisarPorGEidADM(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ? and ADM = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ps.setInt(2, 1);
        ResultSet rs = ps.executeQuery();
        List<MembroDO> Items = new ArrayList<MembroDO>();
        while (rs.next()) {
            MembroDO i = new MembroDO();
            i.setId(rs.getInt("MEMBERid"));
            i.setGEid(rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            i.setAprovado(rs.getInt("Aprovado"));
            Items.add(i);
        }
        return Items;
    } // pesquisar por GEid

    public List<MembroDO> pesquisarPorGEid(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ResultSet rs = ps.executeQuery();
        List<MembroDO> Items = new ArrayList<MembroDO>();
        while (rs.next()) {
            MembroDO i = new MembroDO();
            i.setId(rs.getInt("MEMBERid"));
            i.setGEid(rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            i.setAprovado(rs.getInt("Aprovado"));
            Items.add(i);
        }
        return Items;
    } // pesquisar por GEid

    public List<MembroDO> pesquisarPorUSUid(int USUid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where USUid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, USUid);
        ResultSet rs = ps.executeQuery();
        List<MembroDO> Items = new ArrayList<MembroDO>();
        while (rs.next()) {
            MembroDO i = new MembroDO();
            i.setId(rs.getInt("MEMBERid"));
            i.setGEid(rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            i.setAprovado(rs.getInt("Aprovado"));
            Items.add(i);
        }
        return Items;
    }//pesquisar por USUid

    public List<MembroDO> AdminedGroups(int usrID, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where USUid = ? and ADM = 1";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, usrID);
        ResultSet rs = ps.executeQuery();
        List<MembroDO> Items = new ArrayList<MembroDO>();
        while (rs.next()) {
            MembroDO i = new MembroDO();
            i.setId(rs.getInt("MEMBERid"));
            i.setGEid(rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            i.setAprovado(rs.getInt("Aprovado"));
            Items.add(i);
        }
        return Items;
    }
}
