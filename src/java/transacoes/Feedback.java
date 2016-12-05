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
public class Feedback {
    public boolean incluir (FeedbackDO feedback) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                FeedbackData a = new FeedbackData();
                a.incluir(feedback, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    public boolean excluir (FeedbackDO feedback) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                FeedbackData a = new FeedbackData();
                a.excluir(feedback, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean atualizar (FeedbackDO feedback) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                FeedbackData a = new FeedbackData();
                a.atualizar(feedback, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar");
            e.printStackTrace();
        }
        return false;
    }
    public FeedbackDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    FeedbackData a = new FeedbackData();
	    FeedbackDO i = a.buscar(id, tr);
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
}
