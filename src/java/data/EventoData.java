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
        String sql = "insert into evento (EVEnome,EVEdescricao,EVEtipo,EVEhorario_de_inicio,EVEhorario_de_termino,EVEdata,EVEmacro_evento,EVEpasta_de_imagens,EVEavaliacao,EVEnumeroava,EVEativo,EVElink) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);   
        ps.setString(1, evento.getNome());
        ps.setString(2, evento.getDescricao());
        ps.setString(3, evento.getTipo());
        ps.setTime(4,evento.getHoraInicial());
        ps.setTime(5,evento.getHoraFinal());
        ps.setDate(6, evento.getData());
        ps.setInt(7, boolToInt(evento.isMacroEvento()));
        ps.setString(8,"evento");
        ps.setInt(9, 0);
        ps.setInt(10,0);
        ps.setInt(11, 1);
        ps.setString(12, evento.getLink());
        int result = ps.executeUpdate();
        
        sql= "SELECT LAST_INSERT_ID();";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.first();
        evento.setId(rs.getInt("LAST_INSERT_ID()"));
        evento.setAvaliação(0);
        evento.setNumeroava(0);
        
    }// incluir

    public void excluir(EventoDO evento, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String[] sql = {"delete from evento where evento.EVEid = ?",
                "delete from comentario where comentario.eveid = ?",
                "delete from feedback where feedback.EVEid = ?",
                "delete from seguindo where seguindo.EVEid = ?",
                "delete from realiza where realiza.EVEid = ?",
                "delete from acontece where acontece.EVEid = ?",""};
        if(evento.isMacroEvento()){
            sql[6]="delete from pertence where pertence.macroEventoId = ?;";
        }else{
            sql[6]="delete from pertence where pertence.microEventoId = ?;";
        }
        for(int i=0;i<7;i++){
            PreparedStatement ps = con.prepareStatement(sql[i]);
            ps.setInt(1, evento.getId());
            ps.execute();
        }
    } // excluir

  public void atualizar(EventoDO evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update evento set EVEnome=?, EVEdescricao=?, EVEtipo=?, EVEmacro_evento=?, EVEhorario_de_inicio=?, EVEhorario_de_termino=?, EVEdata=?, EVEpasta_de_imagens=?, EVEavaliacao=?,EVEnumeroava=?, EVEativo=?, EVElink=?   where EVEid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, evento.getNome());
     ps.setString(2, evento.getDescricao());
     ps.setString(3, evento.getTipo());
     ps.setInt(4, boolToInt(evento.isMacroEvento()));
     ps.setTime(5, evento.getHoraInicial());
     ps.setTime(6, evento.getHoraFinal());
     ps.setDate(7, evento.getData());
     ps.setString(8, evento.getPastaimagens());
     ps.setInt(9, evento.getAvaliação());
     ps.setInt(10,evento.getNumeroava());
     ps.setInt(11,boolToInt(evento.isAtivo()));
     ps.setString(12, evento.getLink());
     ps.setInt(13, evento.getId());
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
        evento.setNumeroava(rs.getInt("EVEnumeroava"));
        evento.setAtivo(rs.getInt("EVEativo")==1);
        evento.setLink(rs.getString("EVElink"));
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
        evento.setNumeroava(rs.getInt("EVEnumeroava"));
        evento.setAtivo(rs.getInt("EVEativo")==1);
        evento.setLink(rs.getString("EVElink"));
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
            evento.setNumeroava(rs.getInt("EVEnumeroava"));
            evento.setAtivo(rs.getInt("EVEativo")==1);
            evento.setLink(rs.getString("EVElink"));
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
            evento.setNumeroava(rs.getInt("EVEnumeroava"));
            evento.setAtivo(rs.getInt("EVEativo")==1);
            evento.setLink(rs.getString("EVElink"));
            Items.add(evento);
        }
        return Items;
    }        
    public List<EventoDO> buscarSemana(java.sql.Date data1, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from evento where EVEdata between ? and ? + INTERVAL 7 DAY;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDate(1, data1);
        ps.setDate(2, data1);
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
            evento.setNumeroava(rs.getInt("EVEnumeroava"));
            evento.setAtivo(rs.getInt("EVEativo")==1);
            evento.setLink(rs.getString("EVElink"));
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
            evento.setNumeroava(rs.getInt("EVEnumeroava"));
            evento.setAtivo(rs.getInt("EVEativo")==1);
            evento.setLink(rs.getString("EVElink"));
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
            evento.setNumeroava(rs.getInt("EVEnumeroava"));
            evento.setAtivo(rs.getInt("EVEativo")==1);
            evento.setLink(rs.getString("EVElink"));
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
