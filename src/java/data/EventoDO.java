/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Time;
import java.sql.Date;

/**
 *
 * @author Convidado
 */
public class EventoDO {
    private int id;
    private String nome;
    private String descricao;
    private String tipo;
    private int macroEvento;
    private String HoraInicial;
    private String HoraFinal;
    private String data;
    private String pastaimagens;
    private int avaliação;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
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
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
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
     * @return the macroEvento
     */
    public int getMacroEvento() {
        return macroEvento;
    }

    /**
     * @param macroEvento the macroEvento to set
     */
    public void setMacroEvento(int macroEvento) {
        this.macroEvento = macroEvento;
    }

    /**
     * @return the HoraInicial
     */
    public String getHoraInicial() {
        return HoraInicial;
    }

    /**
     * @param HoraInicial the HoraInicial to set
     */
    public void setHoraInicial(String HoraInicial) {
        this.HoraInicial = HoraInicial;
    }

    /**
     * @return the HoraFinal
     */
    public String getHoraFinal() {
        return HoraFinal;
    }

    /**
     * @param HoraFinal the HoraFinal to set
     */
    public void setHoraFinal(String HoraFinal) {
        this.HoraFinal = HoraFinal;
    }

    /**
     * @return the data
     */
    public String getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(String data) {
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
