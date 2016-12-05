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
public class Comentario {
    public boolean incluir (ComentarioDO com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ComentarioData a = new ComentarioData();
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
    public boolean excluir (ComentarioDO com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ComentarioData a = new ComentarioData();
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
    
    public boolean atualizar (ComentarioDO com) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ComentarioData a = new ComentarioData();
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
    public ComentarioDO buscar(int id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ComentarioData a = new ComentarioData();
	    ComentarioDO i = a.buscar(id, tr);
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
