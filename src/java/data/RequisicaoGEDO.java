/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
/**
 *
 * @author LUIS FELIPE
 */
public class RequisicaoGEDO {
    private int userId;
    private int GEId;
    private Date dataReq;
    private String mensagem;
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGEId() {
        return GEId;
    }

    public void setGEId(int GEId) {
        this.GEId = GEId;
    }

    public Date getDataReq() {
        return dataReq;
    }

    public void setDataReq(Date dataReq) {
        this.dataReq = dataReq;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

}