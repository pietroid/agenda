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
public class EventoData {
    
    public void incluir(EventoDO evento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into evento (EVEnome,EVEdescricao,EVEtipo,EVEhorario_de_inicio,EVEhorario_de_termino,EVEdata,EVEmacro_evento,EVEpasta_de_imagens,EVEavaliacao) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);   
        ps.setString(1, evento.getNome());
        ps.setString(2, evento.getDescricao());
        ps.setString(3, evento.getTipo());
        ps.setInt(4, evento.getMacroEvento());
        ps.setString(5, evento.getHoraInicial());
        ps.setString(6, evento.getHoraFinal());
        ps.setString(7, evento.getData());
        ps.setString(8, evento.getPastaimagens());
        ps.setInt(9, evento.getAvaliação());
        int result = ps.executeUpdate();
    }// incluir

    public void excluir(EventoDO evento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from evento where EVEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, evento.getId());
        int result = ps.executeUpdate();
    } // excluir

  public void atualizar(EventoDO evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update evento set EVEnome=?, EVEdescricao=?, EVEtipo=?, EVEmacro_evento=?, EVEhorario_de_inicio=?, EVEhorario_de_termino=?, EVEdata=?, EVEpasta_de_imagens=?, EVEavaliacao=?  where EVEid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, evento.getNome());
     ps.setString(2, evento.getDescricao());
     ps.setString(3, evento.getTipo());
     ps.setInt(4, evento.getMacroEvento());
     ps.setString(5, evento.getHoraInicial());
     ps.setString(6, evento.getHoraFinal());
     ps.setString(7, evento.getData());
     ps.setString(8, evento.getPastaimagens());
     ps.setInt(9, evento.getAvaliação());
     ps.setInt(10, evento.getId());
     
     int result = ps.executeUpdate(); 
    } // atualizar

    public EventoDO buscar(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        EventoDO evento = new EventoDO();
        rs.first();
        evento.setId(rs.getInt("EVEid"));
        evento.setNome(rs.getString("EVEnome"));
        evento.setDescricao(rs.getString("EVEdescricao"));
        evento.setTipo(rs.getString("EVEtipo"));
        evento.setHoraInicial(rs.getString("EVEhorario_de_inicio"));
        evento.setHoraFinal(rs.getString("EVEhorario_de_termino"));
        evento.setData(rs.getString("EVEdata"));
        evento.setMacroEvento(rs.getInt("EVEmacro_evento"));
        evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
        evento.setAvaliação(rs.getInt("EVEavaliacao"));
        return evento;
    } // buscar
    
    public EventoDO buscarNome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEnome = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        EventoDO evento = new EventoDO();
        evento.setId(rs.getInt("EVEid"));
        evento.setNome(rs.getString("EVEnome"));
        evento.setDescricao(rs.getString("EVEdescricao"));
        evento.setTipo(rs.getString("EVEtipo"));
        evento.setHoraInicial(rs.getString("EVEhorario_de_inicio"));
        evento.setHoraFinal(rs.getString("EVEhorario_de_termino"));
        evento.setData(rs.getString("EVEdata"));
        evento.setMacroEvento(rs.getInt("EVEmacro_evento"));
        evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
        evento.setAvaliação(rs.getInt("EVEavaliacao"));
        return evento;
    }
 
}
