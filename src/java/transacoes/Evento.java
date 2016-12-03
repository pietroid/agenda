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
            System.out.println("Erro ao incluir ");
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
            System.out.println("Erro ao atualizar" + evento.getId());
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
            System.out.println("Erro ao buscar" + id);
           
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
            System.out.println("Erro ao buscar" + nome);
           
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
