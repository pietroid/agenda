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
    private String descricao;
    private String tipo;
    private int macroEvento;
    private String HoraInicial;
    private String HoraFinal;
    private String data;
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
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descrição the descrição to set
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
     * @return the selo
     */
    public int getMacroEvento() {
        return macroEvento;
    }

    /**
     * @param selo the selo to set
     */
    public void setMacroEvento(int MacroEvento) {
        this.macroEvento = MacroEvento;
    }

    /**
     * @return the horaI
     */
    public String getHoraInicial() {
        return HoraInicial;
    }

    /**
     * @param horaInicial the horaI to set
     */
    public void setHoraInicial(String HoraInicial) {
        this.HoraInicial = HoraInicial;
    }

    /**
     * @return the horaF
     */
    public String getHoraFinal() {
        return HoraFinal;
    }

    /**
     * @param horaFinal the horaF to set
     */
    public void setHoraFinal(String horaFinal) {
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
