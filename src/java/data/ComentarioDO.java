/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Danilo Polidoro
 */
public class ComentarioDO {
    private int id;
    private int eveid;
    private int usuid;
    private String mensagem;

    
    /**
     * @return the nome
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the nome to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
      /**
     * @return the nome
     */
    public int getEveId() {
        return eveid;
    }

    /**
     * @param id the nome to set
     */
    public void setEveId(int id) {
        this.eveid = id;
    }
    
      /**
     * @return the nome
     */
    public int getUsuId() {
        return usuid;
    }

    /**
     * @param id the nome to set
     */
    public void setUsuId(int id) {
        this.usuid = id;
    }

    /**
     * @return the mensagem
     */
    public String getMensagem() {
        return mensagem;
    }

    /**
     * @param mensagem the mensagem to set
     */
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    
    
    
}
