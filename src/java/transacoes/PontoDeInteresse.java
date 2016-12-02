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
public class PontoDeInteresse {
    
    public boolean incluir (PontoDeInteresseDO interesse) throws Exception{
        
        if(isEmpty(String.valueOf(interesse.getINSCid())))  {
            return false;
        }
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                RealizaData realizaData = new RealizaData();
                realizaData.incluir(realiza, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir " + realiza.getREALid());
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public boolean atualizar(RealizaDO realiza) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                RealizaData realizaData = new RealizaData();
                realizaData.atualizar(realiza, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar" + realiza.getREALid());
            e.printStackTrace();
	}
	return false;
    } // atualizar
    
    public RealizaDO buscar(int REALid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    RealizaData realizaData = new RealizaData();
	    RealizaDO i = realizaData.buscar(REALid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + REALid);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public List<RealizaDO> pesquisar(int GEid) {
        if (isEmpty(String.valueOf(GEid)))
        return null;
        Transacao tr = new Transacao();
        
        try {
	    tr.beginReadOnly();
            RealizaData realizaData = new RealizaData();
            List<RealizaDO> list = realizaData.pesquisarPorGEid(GEid, tr);
            tr.commit();
            return list;
        } catch(Exception e) {
            System.out.println("Erro ao pesquisar " + GEid);
            e.printStackTrace();
        }
        return null;
    } // pesquisar por GEid

    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }

    public static void main(String[] args) {
        Realiza a = new Realiza();
        RealizaDO realizainicial = new RealizaDO();
        try {
	    realizainicial = a.buscar(2);
            System.out.println(realizainicial.getREALid());
        } catch(Exception e) {
            e.printStackTrace();
        }
    } // main
}
}
