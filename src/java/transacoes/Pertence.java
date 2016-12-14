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
    
    public boolean excluir(PertenceDO pertence) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.begin();
            PertenceData pertenceData = new PertenceData();
            pertenceData.excluir(pertence, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir " + pertence.getId());
            e.printStackTrace();
	}
	return false;
    }
    
    public boolean excluirPorMacro(int macroId) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.begin();
            PertenceData pertenceData = new PertenceData();
            pertenceData.excluirPorMacro(macroId, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar o evento com macroId = " + macroId);
            e.printStackTrace();
	}
	return false;
    }
    
    public boolean excluirPorMicro(int microId) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.begin();
            PertenceData pertenceData = new PertenceData();
            pertenceData.excluirPorMicro(microId, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir o evento com microId = " + microId);
            e.printStackTrace();
	}
	return false;
    }
    
    public boolean atualizar(PertenceDO pertence) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                PertenceData pertenceData = new PertenceData();
                pertenceData.atualizar(pertence, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar " + pertence.getId());
            e.printStackTrace();
	}
	return false;
    }
    
    public PertenceDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PertenceData pertenceData = new PertenceData();
	    PertenceDO i = pertenceData.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar o micro: " + id);
	}
	return null;
    }
    
    public List<Integer> buscarMicroPorMacro(EventoDO evento) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PertenceData pertenceData = new PertenceData();
	    List<Integer> i = pertenceData.buscarMicroPorMacro(evento, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + evento.getId());
            e.printStackTrace();
	}
	return null;
    } // buscar

}
