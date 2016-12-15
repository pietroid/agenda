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
 * @author LUIS FELIPE
 */
public class QGData {
     public void incluir(QGDO local, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.QG (POI_id,GEid) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, local.getPOI_id());
        ps.setInt(2, local.getGEid()); 
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        local.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(QGDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.QG where QGid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getId());
        int result = ps.executeUpdate();
    } // excluir

    public QGDO buscarPorGE(int GEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.QG where GEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, GEid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        QGDO local = new QGDO();
        local.setId(rs.getInt("QGid"));
        local.setPOI_id(rs.getInt("POI_id"));
        local.setGEid(rs.getInt("GEid"));
        return local;
    } // buscar
}
