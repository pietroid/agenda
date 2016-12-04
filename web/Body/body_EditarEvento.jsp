<%-- 
    Document   : body_EditarEvento
    Created on : 03/12/2016, 17:16:39
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
        <title>Editar evento</title>
    </head>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <%
        /*if ( request.getAttribute("EVEid") == null) {
            pageContext.forward("index.jsp");
        }*/
        //int EVEid = Integer.parseInt((String)request.getAttribute("EVEid"));
        int EVEid = 1;
        Evento eventotn = new Evento();
        EventoDO evento = new EventoDO();
        evento = eventotn.buscar(EVEid);
        int action = evento.getMacroEvento();
        if(action != 0){
    %>
    <div align = "left|justify">
        <FORM action="http://www.google.com.br/formtest" method="post">
            Nome do Evento:
            <INPUT type="text" name="EVEnome" maxlength = "30"><BR>
            Descrição:
            <INPUT type="text" name="EVEdescricao" maxlength = "140" size = "140"><BR>
            Tipo do evento:
            <INPUT type="text" name="EVEtipo"><BR>
            Horário de início:
            <INPUT type="number" name="EVEhoraI" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminI" min = "0" max = "59" size = "2"><BR>
            Horário de término:
            <INPUT type="number" name="EVEhoraT" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminT" min = "0" max = "59" size = "2"><BR>
            Data (dd/mm/yyyy):
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR>
            Macro evento:
            <INPUT type="text" name="EVEmacro_evento"> <BR>
            <INPUT type="submit" name="submit1" value="Submit">
        </FORM>
        <BR><BR>
    </div>
    <% 
            if (request.getParameter("submit1") != null){
                if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
                if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
                if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
                if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null) evento.setHoraInicial(request.getParameter("EVEhoraI") + ":" + request.getParameter("EVEminI"));
                if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null) evento.setHoraFinal(request.getParameter("EVEhoraT") + ":" + request.getParameter("EVEminT"));
                if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null) evento.setData(request.getParameter("EVEdataD") + "/" + request.getParameter("EVEdataM") + "/" + request.getParameter("EVEdataY"));
                if (request.getParameter("EVEmacro_evento") != null){
                    EventoDO macro = eventotn.buscarNome("EVEmacro_evento");
                    evento.setMacroEvento(macro.getId());
                }
            }
        }
        if(action == 0){
    %>
    <div align = "left|justify">
        <FORM action="http://www.google.com.br/formtest" method="post">
            Nome do Evento:
            <INPUT type="text" name="EVEnome" maxlength = "30"> <BR>
            Descrição:
            <INPUT type="text" name="EVEdescricao" maxlength = "140" size = "140"><BR>
            Tipo:
            <INPUT type="text" name="EVEtipo"><BR>
             Horário de início:
            <INPUT type="number" name="EVEhoraI" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminI" min = "0" max = "59" size = "2"><BR>
            Horário de término:
            <INPUT type="number" name="EVEhoraT" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminT" min = "0" max = "59" size = "2"><BR>
            Data (dd/mm/yyyy):
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR>
            <INPUT type="submit" name="submit2" value="Submit">
        </FORM>
        <BR><BR>
    </div>
    <% 
            if (request.getParameter("submit2") != null){
                if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
                if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
                if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
                if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null) evento.setHoraInicial(request.getParameter("EVEhoraI") + ":" + request.getParameter("EVEminI"));
                if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null) evento.setHoraFinal(request.getParameter("EVEhoraT") + ":" + request.getParameter("EVEminT"));
                if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null) evento.setData(request.getParameter("EVEdataD") + "/" + request.getParameter("EVEdataM") + "/" + request.getParameter("EVEdataY"));
            }
        }
        boolean update = eventotn.atualizar(evento);
    %>
    </body>
</html>
