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
public class RequisicaoGEData {
    public void incluir(RequisicaoGEDO req, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into agenda.requisicaoGE (userId,GEId,dataReq,mensagem) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, req.getUserId());
        ps.setInt(2, req.getGEId());
        ps.setDate(3, req.getDataReq());
        ps.setString(4, req.getMensagem());
            
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(RequisicaoGEDO req, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from agenda.requisicaoGE where userId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, req.getUserId());
        int result = ps.executeUpdate();
    } // excluir

    public RequisicaoGEDO buscar(int userId, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.requisicaoGE where userId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        RequisicaoGEDO req = new RequisicaoGEDO();
        req.setUserId(rs.getInt("userId"));
        req.setGEId(rs.getInt("GEId"));
        req.setDataReq(rs.getDate("dataReq"));
        req.setMensagem(rs.getString("mensagem"));
        return req;
    } // buscar
}
