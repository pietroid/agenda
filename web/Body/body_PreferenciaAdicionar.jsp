<%-- 
    Document   : body_PreferenciaAdicionar
    Created on : 07/12/2016, 04:01:23
    Author     : daniel
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="data.UsuarioDO"%>
<%@page import ="transacoes.Usuario"%>
<%@page import ="data.EventoDO"%>
<%@page import ="data.PreferenciaDO"%>
<%@page import ="transacoes.Preferencia"%>
<%@page import ="data.GEDO"%>
<%@page import ="transacoes.GE"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    if (request.getParameter("grupo") == null && request.getParameter("submit") == null) {
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
        // UsuarioDO usuario = new UsuarioDO();
        List<PreferenciaDO> listaPreferencia = new ArrayList<PreferenciaDO>();
        Preferencia preferenciatn = new Preferencia();
        listaPreferencia = preferenciatn.pesquisarPorUser(usuario);
        List<GEDO> listaGE = new ArrayList<GEDO>();
        GE GEtn = new GE();
        listaGE = GEtn.buscarTodos();
        if (listaGE.size() == listaPreferencia.size()) {
    %>
            <h1>
                <center>Você já segue todos os grupos de extensão!</center>
            </h1>
    <%
        }
        else {
    %>
            <form action="PreferenciaAdicionar.jsp">
                <select name = "grupo">
    <%
            boolean jaSegue = false;
            for (int i = 0; i < listaGE.size(); i++) {
                jaSegue = false;
                List<PreferenciaDO> listaPreferenciaPorGEid = preferenciatn.pesquisarPorGEid(listaGE.get(i).getId());
                for (int j = 0; j < listaPreferenciaPorGEid.size(); j++) {
                    if (listaPreferenciaPorGEid.get(j).getUSUid() == usuario.getId() && listaGE.get(i).getAutorizado()==1) {

                    jaSegue = true;
                    }
                }
                if (jaSegue == false) {
    %>           
                    <option value="<%=listaGE.get(i).getId()%>"><%=listaGE.get(i).getNome()%></option>
    <%
                }
            }
    %>
                
                </select>
                <input type="submit" name="submit" value="Adicionar">
            </form>
    <%
        }
    %>

    <%    
    }    
    else {
        int GEid = Integer.parseInt(request.getParameter("grupo"));
        GE GEtn = new GE();
        GEDO GE = GEtn.buscar(GEid);        
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");        
        PreferenciaDO preferencia = new PreferenciaDO();
        preferencia.setGEid(GE.getId());
        preferencia.setUSUid(usuario.getId());
        List<PreferenciaDO> listaPreferencia = new ArrayList<PreferenciaDO>();
        Preferencia preferenciatn = new Preferencia();
        listaPreferencia = preferenciatn.pesquisarPorUser(usuario);
        boolean jaSegue = false;
        for (int i = 0; i < listaPreferencia.size(); i++) {
            if (listaPreferencia.get(i).getGEid() == GE.getId()) {
                jaSegue = true;
            }
        }
        if (jaSegue == true) {
%>
            <font face="verdana">
            <h2><center>Você já segue o grupo <%=GE.getNome()%>!</center></h2> 
            <BR><a href="Preferencia.jsp" target="_top">Voltar para a página de preferências</a>
<%
        } 
        else if (preferenciatn.incluir(preferencia)) {            
%>
           <font face="verdana">
            <h2><center>O grupo <%=GE.getNome()%> foi adicionado aos favoritos!</center></h2> 
            <BR><a href="Preferencia.jsp" target="_top">Voltar para a página de preferências</a>
<%
        } else {
%>
            <font face="verdana">
            <h2><center>Houve um erro e o grupo não pôde ser adicionado.</center></h2> 
            <BR><a href="Preferencia.jsp" target="_top">Voltar para a página de preferências</a>
    
<%
        }     
    }
%>
</html>
