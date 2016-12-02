/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Convidado
 */
public class EventoDO {
    private int id;
    private String nome;
    private String descrição;
    private String tipo;
    private int selo;
    private int horaInicial;
    private int horaFinal;
    private int data;
    private String pastaimagens;
    private int avaliação;
    
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
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the descrição
     */
    public String getDescrição() {
        return descrição;
    }

    /**
     * @param descrição the descrição to set
     */
    public void setDescrição(String descrição) {
        this.descrição = descrição;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the selo
     */
    public int getSelo() {
        return selo;
    }

    /**
     * @param selo the selo to set
     */
    public void setSelo(int selo) {
        this.selo = selo;
    }

    /**
     * @return the horaI
     */
    public int getHoraInicial() {
        return horaInicial;
    }

    /**
     * @param horaInicial the horaI to set
     */
    public void setHoraInicial(int horaInicial) {
        this.horaInicial = horaInicial;
    }

    /**
     * @return the horaF
     */
    public int getHoraFinal() {
        return horaFinal;
    }

    /**
     * @param horaFinal the horaF to set
     */
    public void setHoraFinal(int horaFinal) {
        this.horaFinal = horaFinal;
    }

    /**
     * @return the data
     */
    public int getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(int data) {
        this.data = data;
    }

    /**
     * @return the pastaimagens
     */
    public String getPastaimagens() {
        return pastaimagens;
    }

    /**
     * @param pastaimagens the pastaimagens to set
     */
    public void setPastaimagens(String pastaimagens) {
        this.pastaimagens = pastaimagens;
    }

    /**
     * @return the avaliação
     */
    public int getAvaliação() {
        return avaliação;
    }

    /**
     * @param avaliação the avaliação to set
     */
    public void setAvaliação(int avaliação) {
        this.avaliação = avaliação;
    }
    
    
    
}
