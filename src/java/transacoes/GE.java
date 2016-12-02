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
        
        if(isEmpty(String.valueOf(GE.getId())))  {
            return false;
        }
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                GEData GEData = new GEData();
                GEData.incluir(GE, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir " + GE.getId());
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

    public static void main(String[] args) {
        GE a = new GE();
        GEDO GEinicial = new GEDO();
        try {
	    GEinicial = a.buscar(2);
            System.out.println(GEinicial.getId());
        } catch(Exception e) {
            e.printStackTrace();
        }
    } // main
}
