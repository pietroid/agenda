/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.    
 */
package data;

import java.sql.Date;

/**
 *
 * @author Pietro
 */
public class UsuarioDO {
    
    private int id;
    private String username;
    private String senha;
    private String nome;
    private String email;
    private String bio;
    private String imagem="";
    private Date data;
    private String curso;
    private Date ingresso;
    private String pasta="";
    private boolean superUser=false;
    private String Pergunta;
    private String Resposta;

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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
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
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the bio
     */
    public String getBio() {
        return bio;
    }

    /**
     * @param bio the bio to set
     */
    public void setBio(String bio) {
        this.bio = bio;
    }

    /**
     * @return the imagem
     */
    public String getImagem() {
        return imagem;
    }

    /**
     * @param imagem the imagem to set
     */
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the curso
     */
    public String getCurso() {
        return curso;
    }

    /**
     * @param curso the curso to set
     */
    public void setCurso(String curso) {
        this.curso = curso;
    }

    /**
     * @return the ingresso
     */
    public Date getIngresso() {
        return ingresso;
    }

    /**
     * @param ingresso the ingresso to set
     */
    public void setIngresso(Date ingresso) {
        this.ingresso = ingresso;
    }

    /**
     * @return the pasta
     */
    public String getPasta() {
        return pasta;
    }

    /**
     * @param pasta the pasta to set
     */
    public void setPasta(String pasta) {
        this.pasta = pasta;
    }

    /**
     * @return the superUser
     */
    public boolean isSuperUser() {
        return superUser;
    }

    /**
     * @param superUser the superUser to set
     */
    public void setSuperUser(boolean superUser) {
        this.superUser = superUser;
    }
    
    public String getResposta(){
            return this.Resposta;
    }
    
    public void setResposta(String resposta){
            this.Resposta = resposta ;
    }
    
    public String getPergunta(){
            return this.Pergunta;
    }
    
    public void setPergunta(String resposta){
            this.Pergunta = resposta ;
    }
    
}
