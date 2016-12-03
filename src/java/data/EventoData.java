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
        String sql = "insert into evento (EVEnome,EVEdescricao,EVEtipo,EVEmacro_evento,EVEhorario_de_inicio,EVEhora_de_termino,EVEdata,EVEpasta_de_imagens,EVEavaliação) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);   
        ps.setString(1, evento.getNome());
        ps.setString(2, evento.getDescrição());
        ps.setString(3, evento.getTipo());
        ps.setInt(4, evento.getSelo());
        ps.setInt(5, evento.getHoraInicial());
        ps.setInt(6, evento.getHoraFinal());
        ps.setInt(7, evento.getData());
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
     String sql = "update evento set EVEnome=?, EVEdescricao=?, EVEtipo=?, EVEmacro_evento=?, EVEhorario_de_inicio=?, EVEhorario_de_termino, EVEdata=?, EVEpasta_de_imagens=?, EVE_avaliação=?  where EVEid=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, evento.getNome());
     ps.setString(2, evento.getDescrição());
     ps.setString(3, evento.getTipo());
     ps.setInt(4, evento.getSelo());
     ps.setInt(5, evento.getHoraInicial());
     ps.setInt(6, evento.getHoraFinal());
     ps.setInt(7, evento.getData());
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
        evento.setId(rs.getInt("EVEid"));
        evento.setNome(rs.getString("EVEnome"));
        evento.setDescrição(rs.getString("EVEdescricao"));
        evento.setTipo(rs.getString("EVEtipo"));
        evento.setHoraInicial(rs.getInt("EVEhorario_de_inicio"));
        evento.setHoraFinal(rs.getInt("EVEhorario_de_termino"));
        evento.setData(rs.getInt("EVEdata"));
        evento.setSelo(rs.getInt("EVEmacro_evento"));
        evento.setPastaimagens(rs.getString("EVEpasta_de_imagens"));
        evento.setAvaliação(rs.getInt("EVEavaliacao"));

        return evento;
    } // buscar
 
}
