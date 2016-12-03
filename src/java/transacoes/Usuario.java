package transacoes;

import utils.*;
import data.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class Usuario {
    public boolean incluir (UsuarioDO usuario) throws Exception{
        
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                UsuarioData usuarioData = new UsuarioData();
                usuarioData.incluir(usuario, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("Erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    } // incluir
    public boolean verificar(UsuarioDO usuario) throws Exception{
        //Regras de negocio
        if(usuario == null || usuario.getUsername() == null){
            return false;
        }
        
        Transacao tr = new Transacao();
        
	try{
            tr.beginReadOnly();
  	    UsuarioData dt = new UsuarioData();
	    UsuarioDO i = dt.buscar(usuario.getUsername(), tr);
            tr.commit();
            if (i != null && i.getSenha().compareTo(usuario.getSenha())==0){
                return true;
            }
            else {
                return false;
            }
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + usuario.getUsername());
            e.printStackTrace();
	}
	return false;
    }
    public UsuarioDO buscarPorUsername(String username) throws Exception{
        UsuarioDO usuario;
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
  	    UsuarioData dt = new UsuarioData();
	    usuario = dt.buscar(username, tr);
            tr.commit();
            return usuario;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("Erro ao buscar" + username);
            e.printStackTrace();
            return null;
	}
    }

}
