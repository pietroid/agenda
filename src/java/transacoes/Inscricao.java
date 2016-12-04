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
public class Inscricao {
    public boolean incluir (InscricaoDO ins) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                InscricaoData a = new InscricaoData();
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
    
    public InscricaoDO buscar(int INSCid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    InscricaoData a = new InscricaoData();
	    InscricaoDO i = a.buscar(INSCid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + INSCid);
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
}
