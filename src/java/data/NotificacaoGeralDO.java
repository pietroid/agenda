/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Pietro
 */
public class NotificacaoGeralDO {
    private int id;
    private int usuid;
    private int IDassociado;
    private String mensagem;
    private int classificacao;
    

    
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
    
    /*
    retona o IDassociado
    */
    public int getIDassociado(){
        return IDassociado;
    }
    /**
    *@param eventoAssociado the IDassociado to set 
    */
    public void setIDassociado(int eventoAssociado){
        this.IDassociado = eventoAssociado;
    }
    /**
     * @return classificacao 
     */
    public int getClassificacao(){
        return classificacao; 
    } 
    /**
     * @param classificacao the classificacao to set 
     */
    public void setClassificacao(int classificacao){
        this.classificacao = classificacao;
    }
}
