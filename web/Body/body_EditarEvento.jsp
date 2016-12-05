<%-- 
    Document   : body_EditarEvento
    Created on : 03/12/2016, 17:16:39
    Author     : Marcus;
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
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
        Pertence pertencetn = new Pertence();
        PertenceDO pertence = new PertenceDO();
        evento = eventotn.buscar(EVEid);
        if (request.getParameter("submit1") != null){
            if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
            if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
            if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
            if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
            if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
            if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
            if (request.getParameter("EVEmacro_evento") != null){
                EventoDO macro2 = eventotn.buscarNome("EVEmacro_evento");
                if (macro2 != null){
                    pertence = pertencetn.buscar(evento.getId());
                    pertence.setMacroId(macro2.getId());
                    boolean updatepertence = pertencetn.atualizar(pertence);
                }
            }
            boolean updateevento = eventotn.atualizar(evento);
        }
        if (request.getParameter("submit2") != null){
            if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
            if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
            if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
             if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
            if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
            if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
            boolean update = eventotn.atualizar(evento);
        }
        int macro = evento.getMacroEvento();
        if(macro == 1){
    %>
    <div align = "left|justify">
        <form action = "body_EditarEvento.jsp" methd = "post">
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
        }
        if(macro == 0){
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
        }
    %>
    </body>
</html>
