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
public class Seguindo {
    public boolean incluir (SeguindoDO ins) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                SeguindoData a = new SeguindoData();
                a.incluir(ins, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
     public boolean excluir (SeguindoDO seguindo) throws Exception{       
        Transacao tr = new Transacao();
        try {
            tr.begin();
            SeguindoData a = new SeguindoData();
            a.excluir(seguindo, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public SeguindoDO buscar(int INSCid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    SeguindoData a = new SeguindoData();
	    SeguindoDO i = a.buscar(INSCid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + INSCid);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public List<SeguindoDO> pesquisarPorUSUid(int USUid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    SeguindoData SeguindoData = new SeguindoData();
	    List<SeguindoDO> i = SeguindoData.pesquisarPorUSUid(USUid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao listar ");  
	}
	return null;
    }
    
    public List<SeguindoDO> matchUsrEvent(int USUid, int EVEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    SeguindoData SeguindoData = new SeguindoData();
	    List<SeguindoDO> i = SeguindoData.matchUsrEvent(USUid, EVEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao listar ");  
	}
	return null;
    }    
    
    public List<SeguindoDO> pesquisarPorEVEid(int EVEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    SeguindoData SeguindoData = new SeguindoData();
	    List<SeguindoDO> i = SeguindoData.pesquisarPorEVEid(EVEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao listar ");  
	}
	return null;
    }
    
    public boolean isSeguindo(int USUid, int EVEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    SeguindoData a = new SeguindoData();
	    boolean i = a.isSeguindo(USUid, EVEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + USUid);
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
