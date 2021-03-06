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
public class Membro {
    public boolean incluir (MembroDO membro) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                MembroData a = new MembroData();
                a.incluir(membro, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public boolean alterar (MembroDO membro) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                MembroData a = new MembroData();
                a.atualizar(membro, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao alterar ");
            e.printStackTrace();
        }
        return false;
    } // alterar
    
    public MembroDO buscar(int MEMBERid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    MembroDO i = a.buscar(MEMBERid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + MEMBERid);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
    public List<MembroDO> buscarPorUSUid(int MEMBERid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    List<MembroDO> Lista = a.pesquisarPorUSUid(MEMBERid, tr);
            tr.commit();
            return Lista;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + MEMBERid);
            e.printStackTrace();
	}
	return null;
    } // Cria uma lista da busca pelo ID do usuario
    
    public List<MembroDO> buscarPorGE(int GEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    List<MembroDO> Lista = a.pesquisarPorGEidADM(GEid, tr);
            tr.commit();
            return Lista;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + GEid);
            e.printStackTrace();
	}
	return null;
    } // Cria uma lista da busca pelo ID do usuario

    public List<MembroDO> buscarPor_N_Apv(int GEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    List<MembroDO> Lista = a.buscarPorUSU_N_Aprv(GEid, tr);
            tr.commit();
            return Lista;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + GEid);
            e.printStackTrace();
	}
	return null;
    } // Cria uma lista da busca pelo ID do usuario

    
    public boolean isADM(int GEid, int USUid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    boolean i = a.isADM(GEid, USUid, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + USUid);
            e.printStackTrace();
	}
	return false;
    }
    
    //Retorna uma Lista de Relacoes de Membro para os quais o Usuario é ADM 
    public List<MembroDO> AdminedGroups(int usrID) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData md = new MembroData();
	    List<MembroDO> i;
            i = md.AdminedGroups(usrID, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar " + usrID);
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
    public List<MembroDO> buscarPorGEidADM(int GEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    List<MembroDO> Lista = a.pesquisarPorGEidADM(GEid, tr);
            tr.commit();
            return Lista;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + GEid);
            e.printStackTrace();
	}
	return null;
    }
    public List<MembroDO> buscarPorGEid(int GEid) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    MembroData a = new MembroData();
	    List<MembroDO> Lista = a.pesquisarPorGEid(GEid, tr);
            tr.commit();
            return Lista;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + GEid);
            e.printStackTrace();
	}
	return null;
    }
    
    public boolean excluir(MembroDO membro) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.begin();
            MembroData membroData = new MembroData();
            membroData.excluir(membro, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao excluir " + membro.getId());
            e.printStackTrace();
	}
	return false;
    }
}
