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
        String sql = "insert into agenda.Membro (GEid, USUid, ADM) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getGEid());
        ps.setInt(2, Membro.getUSUid());
        ps.setInt(3, Membro.getADM());
     
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(MembroDO Membro, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.Membro where MEMBERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getMEMBERid());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(MembroDO Membro, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update agenda.Membro set GEid = ?, USUid = ?, ADM = ? where MEMBERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Membro.getGEid());
        ps.setInt(2, Membro.getUSUid());
        ps.setInt(3, Membro.getADM());
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
        Membro.setMEMBERid(rs.getInt("MEMBERid"));
        Membro.setGEid(rs.getInt("GEid"));
        Membro.setUSUid(rs.getInt("USUid"));
        Membro.setADM(rs.getInt("ADM"));
        return Membro;
    } // buscar
    
    public List<MembroDO> pesquisarPorGEid(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Membro where GEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ResultSet rs = ps.executeQuery();
        System.out.println("Query executada");
        List<MembroDO> Items = new ArrayList<MembroDO>();
        while (rs.next()) {
            MembroDO i = new MembroDO();
            i.setMEMBERid (rs.getInt("MEMBERid"));
            i.setGEid (rs.getInt("GEid"));
            i.setUSUid(rs.getInt("USUid"));
            i.setADM(rs.getInt("ADM"));
            Items.add(i);
        }
        return Items;
    } // pesquisar por GEid
    
    
}
