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
        
        if(isEmpty(String.valueOf(Evento.getId())))  {
            return false;
        }
        
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
            
        }
        return false;
    } // incluir
    
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

    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }

    public static void main(String[] args) {
        Evento a = new Evento();
        EventoDO Eventoinicial = new EventoDO();
        try {
	    Eventoinicial = a.buscar(2);
            System.out.println(Eventoinicial.getId());
        } catch(Exception e) {
            
        }
    } // main
}
