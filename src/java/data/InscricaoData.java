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
public class InscricaoData {
    
    public void incluir(InscricaoDO inscricao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into inscricao (EVEid,USUid) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, inscricao.getId());       
        ps.setInt(2, inscricao.getEveId());
        ps.setInt(3, inscricao.getUsuId());
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(InscricaoDO inscricao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from inscricao where INSCid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, inscricao.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(InscricaoDO inscricao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update inscricao set EVEid=?, USUid=?  where INSCid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, inscricao.getEveId());
     ps.setInt(2, inscricao.getUsuId());
     
     
     int result = ps.executeUpdate(); 
    } // atualizar

    public InscricaoDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from inscricao where INSCid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        InscricaoDO inscricao = new InscricaoDO();
        inscricao.setId(rs.getInt("INSCid"));
        inscricao.setEveId(rs.getInt("EVEid"));
        inscricao.setUsuId(rs.getInt("USUid"));
        
        return inscricao;
    } // buscar
 
}
