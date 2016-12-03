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
 * @author Pietro
 */
public class Pertence {
    
    public boolean incluir (PertenceDO pertence) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PertenceData pertenceData = new PertenceData();
                pertenceData.incluir(pertence, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public List<Integer> pesquisarMicroPorMacro(EventoDO evento) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PertenceData pertenceData = new PertenceData();
	    List<Integer> i = pertenceData.pesquisarMicroPorMacro(evento, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + evento.getId());
            e.printStackTrace();
	}
	return null;
    } // buscar

}