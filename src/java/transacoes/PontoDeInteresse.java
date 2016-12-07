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
    } // buscar por id
    
        public PontoDeInteresseDO buscarnome(String nome) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PontoDeInteresseData PontoDeInteresseData = new PontoDeInteresseData();
	    PontoDeInteresseDO i = PontoDeInteresseData.buscarnome(nome, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + nome);
            e.printStackTrace();
	}
	return null;
    } // buscar por nome
        
    public boolean excluir (PontoDeInteresseDO PontoDeInteresse) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                PontoDeInteresseData point = new PontoDeInteresseData();
                point.excluir(PontoDeInteresse, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir ");
            e.printStackTrace();
        }
        return false;
    } // excluir
    
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
    
    public List<PontoDeInteresseDO> ListarPOI() throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    PontoDeInteresseData PontoDeInteresseData = new PontoDeInteresseData();
	    List<PontoDeInteresseDO> i = PontoDeInteresseData.ListarPOI(tr);
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
