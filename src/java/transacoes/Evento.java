/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;
/**
 *
 * @author Marcus;
 */
public class Evento {
    
    public boolean incluir (EventoDO Evento) throws Exception{
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                EventoData EventoData = new EventoData();
                EventoData.incluir(Evento, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir " + Evento.getId());
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public boolean atualizar(EventoDO evento) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                EventoData eventoData = new EventoData();
                eventoData.atualizar(evento, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar " + evento.getId());
            e.printStackTrace();
	}
	return false;
    }
    
    
    public EventoDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    EventoDO i = EventoData.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + id);
	}
	return null;
    } // buscar
    
    public EventoDO buscarNome(String nome) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    EventoDO i = EventoData.buscarNome(nome, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + nome);
           
	}
	return null;
    }
    
/*    public List<EventoDO> pesquisarPorEVEid(int EVEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    List<EventoDO> i = EventoData.pesquisarPorEVEid(EVEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao listar ");  
	}
	return null;
    }*/
    public List<EventoDO> buscarData(java.sql.Date data) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    List<EventoDO> i = EventoData.buscarData(data, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + data);
           
	}
	return null;
    }    
    
    public List<EventoDO> retornaTodosEventos() throws Exception {
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    List<EventoDO> i = EventoData.retornaTodosEventos(tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao retornar os eventos ");      
	}
	return null;
    }
    public List<EventoDO> buscarMes(java.sql.Date data1, java.sql.Date data2) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    EventoData EventoData = new EventoData();
	    List<EventoDO> i = EventoData.buscarMes(data1, data2, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar datas do mês");
           
	}
	return null;
    }       
    
    public boolean excluir(EventoDO evento) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.begin();
            EventoData eventoData = new EventoData();
            eventoData.excluir(evento, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar" + evento.getId());
            e.printStackTrace();
	}
	return false;
    }

    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }

}
