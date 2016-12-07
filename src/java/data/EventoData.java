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
        ps.setTime(4,evento.getHoraInicial());
        ps.setTime(5,evento.getHoraFinal());
        ps.setDate(6, evento.getData());
        ps.setInt(7, boolToInt(evento.getMacroEvento()));
        ps.setString(8,"evento");
        ps.setInt(9, evento.getAvaliação());
        //int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        evento.setId(rs.getInt("LAST_INSERT_ID()"));
    }// incluir

    public void excluir(EventoDO evento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from evento where EVEid = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, evento.getId());
        ps.executeUpdate();
    } // excluir

  public void atualizar(EventoDO evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update evento set EVEnome=?, EVEdescricao=?, EVEtipo=?, EVEmacro_evento=?, EVEhorario_de_inicio=?, EVEhorario_de_termino=?, EVEdata=?, EVEpasta_de_imagens=?, EVEavaliacao=?, EVEconflito=?  where EVEid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, evento.getNome());
     ps.setString(2, evento.getDescricao());
     ps.setString(3, evento.getTipo());
     ps.setInt(4, boolToInt(evento.getMacroEvento()));
     ps.setTime(5, evento.getHoraInicial());
     ps.setTime(6, evento.getHoraFinal());
     ps.setDate(7, evento.getData());
     ps.setString(8, evento.getPastaimagens());
     ps.setInt(9, evento.getAvaliação());
     ps.setInt(11, boolToInt(evento.isConflito()));
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
        evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
        evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
        evento.setData(rs.getDate("EVEdata"));
        evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
        evento.setAvaliação(rs.getInt("EVEavaliacao"));
        evento.setConflito(rs.getInt("EVEconflito")==1);
        return evento;
    } // buscar
    
    public EventoDO buscarNome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEnome = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        rs.first();
        EventoDO evento = new EventoDO();
        evento.setId(rs.getInt("EVEid"));
        evento.setNome(rs.getString("EVEnome"));
        evento.setDescricao(rs.getString("EVEdescricao"));
        evento.setTipo(rs.getString("EVEtipo"));
        evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
        evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
        evento.setData(rs.getDate("EVEdata"));
        evento.setMacroEvento(rs.getInt("EVEmacro_evento")==1);
        evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
        evento.setAvaliação(rs.getInt("EVEavaliacao"));
        evento.setConflito(rs.getInt("EVEconflito")==1);
        return evento;
    }
    
    public List<EventoDO> buscarData(java.sql.Date data, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEdata = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, data);
        ResultSet rs = ps.executeQuery();
        List<EventoDO> Items = new ArrayList<EventoDO>();
        while (rs.next()) {
            EventoDO evento = new EventoDO();
            evento.setId(rs.getInt("EVEid"));
            evento.setNome(rs.getString("EVEnome"));
            evento.setDescricao(rs.getString("EVEdescricao"));
            evento.setTipo(rs.getString("EVEtipo"));
            evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
            evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
            evento.setData(rs.getDate("EVEdata"));
            evento.setMacroEvento(rs.getInt("EVEmacro_evento")==1);
            evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
            evento.setAvaliação(rs.getInt("EVEavaliacao"));
            evento.setConflito(rs.getInt("EVEconflito")==1);
            Items.add(evento);
        }
        return Items;
    }

    public List<EventoDO> buscarMes(java.sql.Date data1, java.sql.Date data2, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEdata >= ? and EVEdata <= ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, data1);
        ps.setDate(2, data2);
        ResultSet rs = ps.executeQuery();
        List<EventoDO> Items = new ArrayList<EventoDO>();
        while (rs.next()) {
            EventoDO evento = new EventoDO();
            evento.setId(rs.getInt("EVEid"));
            evento.setNome(rs.getString("EVEnome"));
            evento.setDescricao(rs.getString("EVEdescricao"));
            evento.setTipo(rs.getString("EVEtipo"));
            evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
            evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
            evento.setData(rs.getDate("EVEdata"));
            evento.setMacroEvento(rs.getInt("EVEmacro_evento")==1);
            evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
            evento.setAvaliação(rs.getInt("EVEavaliacao"));
            Items.add(evento);
        }
        return Items;
    }        
    
    public List<EventoDO> retornaTodosEventos(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<EventoDO> Items = new ArrayList<EventoDO>();
        while (rs.next()) {
            EventoDO evento = new EventoDO();
            evento.setId(rs.getInt("EVEid"));
            evento.setNome(rs.getString("EVEnome"));
            evento.setDescricao(rs.getString("EVEdescricao"));
            evento.setTipo(rs.getString("EVEtipo"));
            evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
            evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
            evento.setData(rs.getDate("EVEdata"));
            evento.setMacroEvento(rs.getInt("EVEmacro_evento")==1);
            evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
            evento.setAvaliação(rs.getInt("EVEavaliacao"));
            Items.add(evento);
        }
        return Items;
    }
     public List<EventoDO> listarMacro(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEmacro_evento = '1'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<EventoDO> Items = new ArrayList<EventoDO>();
        while (rs.next()) {
            EventoDO evento = new EventoDO();
            evento.setId(rs.getInt("EVEid"));
            evento.setNome(rs.getString("EVEnome"));
            evento.setDescricao(rs.getString("EVEdescricao"));
            evento.setTipo(rs.getString("EVEtipo"));
            evento.setHoraInicial(rs.getTime("EVEhorario_de_inicio"));
            evento.setHoraFinal(rs.getTime("EVEhorario_de_termino"));
            evento.setData(rs.getDate("EVEdata"));
            evento.setMacroEvento(true);
            evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
            evento.setAvaliação(rs.getInt("EVEavaliacao"));
            evento.setConflito(rs.getInt("EVEconflito")==1);
            Items.add(evento);
        }
        return Items;
    }    
    private int boolToInt(boolean value){
        if(value){
            return 1;
        }else{
            return 0;
        }
    }
 
}
