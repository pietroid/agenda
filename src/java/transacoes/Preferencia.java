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
public class Preferencia {
    public boolean incluir (PreferenciaDO preferencia) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PreferenciaData a = new PreferenciaData();
                a.incluir(preferencia, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    public boolean excluir (PreferenciaDO preferencia) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PreferenciaData a = new PreferenciaData();
                a.excluir(preferencia, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean atualizar (PreferenciaDO preferencia) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PreferenciaData a = new PreferenciaData();
                a.atualizar(preferencia, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar");
            e.printStackTrace();
        }
        return false;
    }
    public PreferenciaDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PreferenciaData a = new PreferenciaData();
	    PreferenciaDO i = a.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + id);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
    public PreferenciaDO buscarAPartirDeGeId(int Geid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PreferenciaData a = new PreferenciaData();
	    PreferenciaDO i = a.buscar(Geid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + Geid);
            e.printStackTrace();
	}
	return null;
    } // buscar
        
    public List<PreferenciaDO> pesquisarPorUser (UsuarioDO user) throws Exception {
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PreferenciaData a = new PreferenciaData();
	    List<PreferenciaDO> i = a.pesquisarPorUser(user, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar");
            e.printStackTrace();
	}
	return null;
    }
    
    public List<PreferenciaDO> pesquisarPorGEid (int GEid) throws Exception {
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PreferenciaData a = new PreferenciaData();
	    List<PreferenciaDO> i = a.pesquisarPorGEid(GEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar");
            e.printStackTrace();
	}
	return null; 
    }
    
    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }
}
