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
public class Acontece {
    public boolean incluir (AconteceDO acontece) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                AconteceData a = new AconteceData();
                a.incluir(acontece, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public AconteceDO buscar(int acontece_id) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    AconteceData a = new AconteceData();
	    AconteceDO i = a.buscar(acontece_id, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + acontece_id);
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
