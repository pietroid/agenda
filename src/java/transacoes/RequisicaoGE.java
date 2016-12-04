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
public class RequisicaoGE {
    public boolean incluir (RequisicaoGEDO req) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                RequisicaoGEData a = new RequisicaoGEData();
                a.incluir(req, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public RequisicaoGEDO buscar(int userId) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    RequisicaoGEData a = new RequisicaoGEData();
	    RequisicaoGEDO i = a.buscar(userId, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + userId);
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
