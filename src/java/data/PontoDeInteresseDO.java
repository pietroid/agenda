/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Lucas Freitas
 */
public class PontoDeInteresseDO {
    
    private int id;
    private String nome;
    private String descricao;
    private String endereco;
    private String link_para_maps;
    private String pasta_de_imagens;

    /**
     * @return the POI_id
     */
    public int getId() {
        return id;
    }

    /**
     * @param POI_id the POI_id to set
     */
    public void setId(int id) {
        this.id= id;
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
     * @param descricao the descrição to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the endereço
     */
    public String getEndereco() {
        return endereco;
    }

    /**
     * @param endereco the endereço to set
     */
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    /**
     * @return the link_para_maps
     */
    public String getLink_para_maps() {
        return link_para_maps;
    }

    /**
     * @param link_para_maps the link_para_maps to set
     */
    public void setLink_para_maps(String link_para_maps) {
        this.link_para_maps = link_para_maps;
    }

    /**
     * @return the pasta_de_imagens
     */
    public String getPasta_de_imagens() {
        return pasta_de_imagens;
    }

    /**
     * @param pasta_de_imagens the pasta_de_imagens to set
     */
    public void setPasta_de_imagens(String pasta_de_imagens) {
        this.pasta_de_imagens = pasta_de_imagens;
    }
    
}
