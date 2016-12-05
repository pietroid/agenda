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
 * @author Lucas Freitas
 */
public class PontoDeInteresse {
    public boolean incluir (PontoDeInteresseDO PontoDeInteresse) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PontoDeInteresseData PontoDeInteresseData = new PontoDeInteresseData();
                PontoDeInteresseData.incluir(PontoDeInteresse, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public PontoDeInteresseDO buscar(int POI_id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PontoDeInteresseData PontoDeInteresseData = new PontoDeInteresseData();
	    PontoDeInteresseDO i = PontoDeInteresseData.buscar(POI_id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + POI_id);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
      public boolean atualizar(PontoDeInteresseDO PontoDeInteresse) throws Exception {
        Transacao tr = new Transacao();
	try{
            
            tr.begin();
                PontoDeInteresseData PontoDeInteresseData = new PontoDeInteresseData();
                PontoDeInteresseData.atualizar(PontoDeInteresse, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar" + PontoDeInteresse.getId());
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
