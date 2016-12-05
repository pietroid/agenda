
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
public class RequisicaoMembroData {
    public void incluir(RequisicaoMembroDO req, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.requisicaoMembro (userId,GEId,dataReq,mensagem) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, req.getUserId());
        ps.setInt(2, req.getGEId());
        ps.setDate(3, req.getDataReq());
        ps.setString(4, req.getMensagem());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        req.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(RequisicaoMembroDO req, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.requisicaoMembro where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, req.getId());
        int result = ps.executeUpdate();
    } // excluir

    public RequisicaoMembroDO buscar(int userId, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.requisicaoMembro where userId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        RequisicaoMembroDO req = new RequisicaoMembroDO();
        req.setUserId(rs.getInt("userId"));
        req.setGEId(rs.getInt("GEId"));
        req.setDataReq(rs.getDate("dataReq"));
        req.setMensagem(rs.getString("mensagem"));
        return req;
    } // buscar
}
