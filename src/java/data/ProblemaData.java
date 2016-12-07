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
 * @author Pietro
 */
public class ProblemaData {
    
    public void incluir(ProblemaDO problema, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into problema (USERid,datareport,mensagem) values (?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);      
        ps.setInt(1, problema.getUserId());
        ps.setDate(2, problema.getData());
        ps.setString(3,problema.getMensagem());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        problema.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(ProblemaDO problema, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from problema where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, problema.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(ProblemaDO problema, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update problema set USERid=?, datareport=?, mensagem=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, problema.getUserId());
     ps.setDate(2, problema.getData());
     ps.setString(3,problema.getMensagem());
     ps.setInt(4, problema.getId());
     int result = ps.executeUpdate(); 
    } // atualizar

    public ProblemaDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from problema where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        ProblemaDO problema = new ProblemaDO();
        problema.setId(rs.getInt("id"));
        problema.setUserId(rs.getInt("USERid"));
        problema.setData(rs.getDate("datareport"));
        problema.setMensagem(rs.getString("mensagem"));
        return problema;
    } // buscar
    
    
     public List<ProblemaDO> buscarTodos(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from problema";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<ProblemaDO> Items = new ArrayList<ProblemaDO>();
        while (rs.next()) {
            ProblemaDO i = new ProblemaDO();
           i.setId (rs.getInt("id"));
            i.setMensagem (rs.getString("mensagem"));
            i.setData(rs.getDate("datareport"));
            i.setUserId(rs.getInt("USERid"));
              
            Items.add(i);
        }
        return Items;
    }    
}
