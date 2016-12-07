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
    int GEid = Integer.parseInt(request.getParameter("grupo"));
    GE GEtn = new GE();
    GEDO GE = GEtn.buscar(GEid);        
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    PreferenciaDO preferencia = new PreferenciaDO();
    preferencia.setGEid(GE.getId());
    preferencia.setUSUid(usuario.getId());
    Preferencia preferenciatn = new Preferencia();
    if (preferenciatn.incluir(preferencia)) {
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
%>
</html>
