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
public class AconteceData {

    public void incluir(AconteceDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.acontece (EVEid,POI_id) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getEVEid());
        ps.setInt(2, acontece.getPOI_id()); 
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        acontece.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(AconteceDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.acontece where acontece_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getId());
        int result = ps.executeUpdate();
    } // excluir
    
    public void excluirPorEVEid(int EVEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.acontece where EVEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, EVEid);
        int result = ps.executeUpdate();
    }
    
    public List<AconteceDO> buscarPorPOI(int POI_id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.acontece where POI_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, POI_id);
        ResultSet rs = ps.executeQuery();
        List<AconteceDO> ac = new ArrayList<AconteceDO>();
        while(rs.next()){
            AconteceDO acontece = new AconteceDO();
            acontece.setId(rs.getInt("acontece_id"));
            acontece.setEVEid(rs.getInt("EVEid"));
            acontece.setPOI_id(rs.getInt("POI_id"));
            ac.add(acontece);
        }
        return ac;
    } // buscar
    public AconteceDO buscar(int acontece_id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.acontece where acontece_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece_id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        AconteceDO acontece = new AconteceDO();
        acontece.setId(rs.getInt("acontece_id"));
        acontece.setEVEid(rs.getInt("EVEid"));
        acontece.setPOI_id(rs.getInt("POI_id"));
        return acontece;
    } // buscar
    
    public AconteceDO buscarPorEVEid(int EVEid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.acontece where EVEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, EVEid);
        ResultSet rs = ps.executeQuery();
        rs.first();
        AconteceDO acontece = new AconteceDO();
        acontece.setId(rs.getInt("acontece_id"));
        acontece.setEVEid(rs.getInt("EVEid"));
        acontece.setPOI_id(rs.getInt("POI_id"));
        return acontece;
    }
    
    public void atualizar(AconteceDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update acontece set POI_id=?, EVEid = ? where acontece_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getPOI_id());
        ps.setInt(2, acontece.getEVEid());
        ps.setInt(3, acontece.getId());
        int result = ps.executeUpdate(); 
    }
}
