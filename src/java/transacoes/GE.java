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
public class GE {
    
    public boolean incluir (GEDO GE) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                GEData GEData = new GEData();
                GEData.incluir(GE, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public GEDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    GEData GEData = new GEData();
	    GEDO i = GEData.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + id);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public GEDO buscarNome(String nome) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    GEData GEData = new GEData();
	    GEDO i = GEData.buscarNome(nome, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + nome);
            e.printStackTrace();
	}
	return null;
    } 
    
  public boolean atualizar(GEDO GE) throws Exception {
        Transacao tr = new Transacao();
	try{
            
            tr.begin();
                GEData GEData = new GEData();
                GEData.atualizar(GE, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar" + GE.getId());
            e.printStackTrace();
	}
	return false;
    }

  
    public List<GEDO> buscarTodos() throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    GEData GEData = new GEData();
	    List<GEDO> i = GEData.buscarTodos(tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro");
            e.printStackTrace();
	}
	return null;
    } // buscar
   
  public boolean excluir(GEDO GE) throws Exception {
        Transacao tr = new Transacao();
	try{
            
            tr.begin();
                GEData GEData = new GEData();
                GEData.excluir(GE, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir"+ GE.getId());
            e.printStackTrace();
	}
	return false;
    }
}
