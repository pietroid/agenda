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
 * @author Pietro
 */
public class PertenceData {
    public void incluir(PertenceDO pertence, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into pertence (microEventoId, macroEventoId) values (?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pertence.getMicroId());
        ps.setInt(2, pertence.getMacroId());
     
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(PertenceDO pertence, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
            String sql = "delete from pertence where id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, pertence.getId());
        int result = ps.executeUpdate();
    } // excluir

    public List<Integer> pesquisarMicroPorMacro(EventoDO macroEvento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from pertence where macroEventoId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, macroEvento.getId());
        ResultSet rs = ps.executeQuery();
        List<Integer> itens=new ArrayList<Integer>();
        while (rs.next()) {
            itens.add(rs.getInt("microEventoId"));
        }
        return itens;
    } // buscar
    
    
    
}
