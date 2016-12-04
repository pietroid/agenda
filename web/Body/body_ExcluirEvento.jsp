<%-- 
    Document   : body_ExcluirEvento
    Created on : 03/12/2016, 18:24:01
    Author     : Marcus;
--%>

<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir evento</title>
    </head>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
        <center>
        Deseja excluir o evento?
        <form>
        <INPUT TYPE="RADIO" NAME="Eve " VALUE="s"> Sim
        <INPUT TYPE="RADIO" NAME="Eve" VALUE="n"> Não 
        </form>
        </center>
        <% if ( request.getAttribute("EVEid") == null) {
               pageContext.forward("index.jsp");
           }
           String action = request.getParameter("Eve");
           int EVEid = Integer.parseInt((String)request.getAttribute("EVEid"));
           Evento eventotn = new Evento();
           EventoDO evento = new EventoDO();
           evento = eventotn.buscar(EVEid);
           if(action.equals ("s")){
               eventotn.excluir(evento);
           }
        %>
</body>
</html>
