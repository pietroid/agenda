/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
/*
 *
 * @author Convidado
 */
public class SeguindoData {
    
    public void incluir(SeguindoDO seguindo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into seguindo (EVEid,USUid) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);      
        ps.setInt(1, seguindo.getEveId());
        ps.setInt(2, seguindo.getUsuId());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        seguindo.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(SeguindoDO seguindo, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from seguindo where INSCid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, seguindo.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(SeguindoDO seguindo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update seguindo set EVEid=?, USUid=?  where INSCid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, seguindo.getEveId());
     ps.setInt(2, seguindo.getUsuId());
     ps.setInt(3, seguindo.getId());
     int result = ps.executeUpdate(); 
    } // atualizar

    public SeguindoDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from seguindo where INSCid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        SeguindoDO seguindo = new SeguindoDO();
        seguindo.setId(rs.getInt("INSCid"));
        seguindo.setEveId(rs.getInt("EVEid"));
        seguindo.setUsuId(rs.getInt("USUid"));
        return seguindo;
    } // buscar
 
}
