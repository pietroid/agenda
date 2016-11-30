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
public class RealizaData {
    
    public void incluir(RealizaDO realiza, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.realiza (REALid,GEid,EVEid) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, realiza.getREALid());
        ps.setInt(2, realiza.getGEid());
        ps.setInt(3, realiza.getEVEid());
     
        int result = ps.executeUpdate();
    }

    public void excluir(RealizaDO realiza, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.realiza where REALid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, realiza.getREALid());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(RealizaDO realiza, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update agenda.realiza set GEid = ?, EVEid = ? where REALid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, realiza.getGEid());
        ps.setInt(2, realiza.getEVEid());
        int result = ps.executeUpdate();
    } // atualizar

    public RealizaDO buscar(int REALid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.realiza where REALid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, REALid);
        ResultSet rs = ps.executeQuery();
        rs.next();
        RealizaDO realiza = new RealizaDO();
        realiza.setREALid(rs.getInt("REALid"));
        realiza.setGEid(rs.getInt("GEid"));
        realiza.setEVEid(rs.getInt("EVEid"));
        return realiza;
    } // buscar
    
}
