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
public class FeedbackData {
    
    public void incluir(FeedbackDO feedback, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into feedback (EVEid,USERid,mensagem,rating) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);      
        ps.setInt(1, feedback.getEveId());
        ps.setInt(2, feedback.getUsuId());
        ps.setString(3,feedback.getMensagem());
        ps.setInt(4, feedback.getRating());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        feedback.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(FeedbackDO feedback, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from feedback where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, feedback.getId());
        int result = ps.executeUpdate();
    } // excluir


    public FeedbackDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from feedback where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        FeedbackDO feedback = new FeedbackDO();
        feedback.setId(rs.getInt("id"));
        feedback.setEveId(rs.getInt("EVEid"));
        feedback.setUsuId(rs.getInt("USERid"));
        feedback.setMensagem(rs.getString("mensagem"));
        feedback.setRating(rs.getInt("rating"));
        return feedback;
    } // buscar
    
    public List<FeedbackDO> listarPorUser(int alvoid, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from feedback where USERid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,alvoid);
        ResultSet rs = ps.executeQuery();
        List<FeedbackDO> fd = new ArrayList<FeedbackDO>();
        while(rs.next()){
            FeedbackDO feedback = new FeedbackDO();
            feedback.setId(rs.getInt("id"));
            feedback.setEveId(rs.getInt("EVEid"));
            feedback.setUsuId(rs.getInt("USERid"));
            feedback.setMensagem(rs.getString("mensagem"));
            feedback.setRating(rs.getInt("rating"));
            fd.add(feedback);
        }
        return fd;
    } // buscar
 
 
}
