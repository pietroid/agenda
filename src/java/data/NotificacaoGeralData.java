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
public class NotificacaoGeralData {
    
    public void incluir(NotificacaoGeralDO notificacaoGeral, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into notificacaoGeral (USERalvoid,mensagem) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);  
        ps.setInt(1, notificacaoGeral.getUsuId());
        ps.setString(2,notificacaoGeral.getMensagem());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        notificacaoGeral.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(NotificacaoGeralDO notificacaoGeral, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from notificacaoGeral where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, notificacaoGeral.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(NotificacaoGeralDO notificacaoGeral, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update notificacaoGeral set  USERalvoid=?, mensagem=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, notificacaoGeral.getUsuId());
     ps.setString(2,notificacaoGeral.getMensagem());
     ps.setInt(3, notificacaoGeral.getId());
     int result = ps.executeUpdate(); 
    } // atualizar

    public NotificacaoGeralDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from notificacaoGeral where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        rs.first();
        NotificacaoGeralDO notificacaoGeral = new NotificacaoGeralDO();
        notificacaoGeral.setId(rs.getInt("id"));
        notificacaoGeral.setUsuId(rs.getInt("USERalvoid"));
        notificacaoGeral.setMensagem(rs.getString("mensagem"));
        return notificacaoGeral;
    } // buscar
 
    public List<NotificacaoGeralDO> pesquisarPorUSUid(int USUid,Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select * from agenda.Usuario where USUid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, USUid);
        ResultSet rs = ps.executeQuery();
        List<NotificacaoGeralDO> Items = new ArrayList<NotificacaoGeralDO>();
        while (rs.next()){
            NotificacaoGeralDO i = new NotificacaoGeralDO();
            i.setId (rs.getInt("id"));
            i.setUsuId (rs.getInt("USERalvoid"));
            i.setMensagem (rs.getString("mensagem"));
            i.setClassificacao (rs.getString("classificacao"));
            i.setEVEassociado (rs.getInt("EVEassociado"));
        }
        return Items;
    }//pesquisa notificações por Usuario
}
