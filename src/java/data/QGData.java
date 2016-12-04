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
        String sql = "insert into agenda.QG (QGid,POI_id,GEid) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, local.getQGid());
        ps.setInt(2, local.getPOI_id());
        ps.setInt(3, local.getGEid()); 
            
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(QGDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.QG where QGid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getQGid());
        int result = ps.executeUpdate();
    } // excluir

    public QGDO buscar(int QGid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.QG where QGid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, QGid);
        ResultSet rs = ps.executeQuery();
        QGDO local = new QGDO();
        local.setQGid(rs.getInt("QGid"));
        local.setPOI_id(rs.getInt("EVEid"));
        local.setGEid(rs.getInt("GEid"));
        return local;
    } // buscar
}
