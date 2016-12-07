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
 * @author Pietro
 */
public class NotificacaoGeral {
    public boolean incluir (NotificacaoGeralDO com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                NotificacaoGeralData a = new NotificacaoGeralData();
                a.incluir(com, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    public boolean excluir (int com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                NotificacaoGeralData a = new NotificacaoGeralData();
                a.excluir(com, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir");
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean atualizar (NotificacaoGeralDO com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                NotificacaoGeralData a = new NotificacaoGeralData();
                a.atualizar(com, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao atualizar");
            e.printStackTrace();
        }
        return false;
    }
    public NotificacaoGeralDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    NotificacaoGeralData a = new NotificacaoGeralData();
	    NotificacaoGeralDO i = a.buscar(id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + id);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public List<NotificacaoGeralDO> BuscaNotporUSId(int USId) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    NotificacaoGeralData a = new NotificacaoGeralData();
	    List<NotificacaoGeralDO> Lista = a.pesquisarPorUSUid(USId, tr);
            tr.commit();
            return Lista;
	} catch (Exception e){
            tr.rollback();
            System.out.println("Erro ao buscar" + USId);
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
