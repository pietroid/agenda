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
public class RequisicaoAdmin {
    public boolean incluir (RequisicaoAdminDO req) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                RequisicaoAdminData a = new RequisicaoAdminData();
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
    
    public RequisicaoAdminDO buscar(int userId) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    RequisicaoAdminData a = new RequisicaoAdminData();
	    RequisicaoAdminDO i = a.buscar(userId, tr);
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
