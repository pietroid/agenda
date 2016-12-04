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
public class QG {
    public boolean incluir (QGDO local) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                QGData q = new QGData();
                q.incluir(local, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public QGDO buscar(int QGid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    QGData a = new QGData();
	    QGDO i = a.buscar(QGid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + QGid);
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
