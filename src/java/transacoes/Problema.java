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
 * @author LUIS FELIPE
 */
public class Problema {
    public boolean incluir (ProblemaDO problema) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ProblemaData a = new ProblemaData();
                a.incluir(problema, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    public boolean excluir (ProblemaDO problema) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ProblemaData a = new ProblemaData();
                a.excluir(problema, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean atualizar (ProblemaDO problema) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ProblemaData a = new ProblemaData();
                a.atualizar(problema, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar");
            e.printStackTrace();
        }
        return false;
    }
    public ProblemaDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ProblemaData a = new ProblemaData();
	    ProblemaDO i = a.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + id);
            e.printStackTrace();
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
    
    public List<ProblemaDO> buscarTodos() throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ProblemaData ProblemaData = new ProblemaData();
	    List<ProblemaDO> i = ProblemaData.buscarTodos(tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro");
            e.printStackTrace();
	}
	return null;
    } // buscar    
    
    
    
    
}
