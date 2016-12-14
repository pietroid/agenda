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
public class Acontece {
    public boolean incluir (AconteceDO acontece) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                AconteceData a = new AconteceData();
                a.incluir(acontece, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public AconteceDO buscar(int acontece_id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    AconteceData a = new AconteceData();
	    AconteceDO i = a.buscar(acontece_id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + acontece_id);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
    public AconteceDO buscarPorEVEid(int EVEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    AconteceData a = new AconteceData();
	    AconteceDO i = a.buscarPorEVEid(EVEid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + EVEid);
            e.printStackTrace();
	}
	return null;
    }
    
    public List<AconteceDO> buscarPorPOI(int POI_id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    AconteceData a = new AconteceData();
	    List<AconteceDO> i = a.buscarPorPOI(POI_id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + POI_id);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
    public boolean atualizar(AconteceDO acontece) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                AconteceData aconteceData = new AconteceData();
                aconteceData.atualizar(acontece, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar " + acontece.getId());
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
