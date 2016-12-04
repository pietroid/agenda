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
        String sql = "insert into agenda.acontece (acontece_id,EVEid,POI_id) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getAcontece_id());
        ps.setInt(2, acontece.getEVEid());
        ps.setInt(3, acontece.getPOI_id()); 
            
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(AconteceDO acontece, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.acontece where acontece_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece.getAcontece_id());
        int result = ps.executeUpdate();
    } // excluir

    public AconteceDO buscar(int acontece_id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.realiza where acontece_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, acontece_id);
        ResultSet rs = ps.executeQuery();
        AconteceDO acontece = new AconteceDO();
        acontece.setAcontece_id(rs.getInt("acontece_id"));
        acontece.setEVEid(rs.getInt("EVEid"));
        acontece.setPOI_id(rs.getInt("POI_id"));
        return acontece;
    } // buscar
    
}
