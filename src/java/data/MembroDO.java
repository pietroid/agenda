/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Guilherme
 */
public class MembroDO {
    private int id;
    private int GEid;
    private int USUid;
    private int ADM;
    private int Aprovado;
    

    /**
     * @return the MEMBERid
     */
    public int getId() {
        return id;
    }

    /**
     * @param MEMBERid the MEMBERid to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the GEid
     */
    public int getGEid() {
        return GEid;
    }

    /**
     * @param GEid the GEid to set
     */
    public void setGEid(int GEid) {
        this.GEid = GEid;
    }

    /**
     * @return the USUid
     */
    public int getUSUid() {
        return USUid;
    }

    /**
     * @param USUid the USUid to set
     */
    public void setUSUid(int USUid) {
        this.USUid = USUid;
    }

    /**
     * @return the ADM
     */
    public int getADM() {
        return ADM;
    }

    /**
     * @param ADM the ADM to set
     */
    public void setADM(int ADM) {
        this.ADM = ADM;
    }
    
    
    public int getAprovado() {
        return Aprovado;
    }

 
    public void setAprovado(int MembroAprovado) {
        this.Aprovado = MembroAprovado;
    }
}
