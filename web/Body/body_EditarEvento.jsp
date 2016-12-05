<%-- 
    Document   : body_EditarEvento
    Created on : 03/12/2016, 17:16:39
    Author     : Marcus;
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
    <%
    if (request.getAttribute("evento") != null) {
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-mm-dd");
        EventoDO evento = (EventoDO) session.getAttribute("evento");
        Evento eventotn = new Evento();
        boolean updateevento = false;
        Pertence pertencetn = new Pertence();
        PertenceDO pertence = new PertenceDO();
    %>
    <body BGCOLOR = #f2f2f2>
        <center>
            <h1> Edição de evento </h1>
            <BR><BR>
            <h2> Modificar o evento: <%= evento.getNome() %> </h2><BR><BR>
        </center>
    <font face="verdana">
    <%
            if (request.getParameter("submit1") != null){
                if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals(""))) evento.setNome(request.getParameter("EVEnome"));
                if (request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEdescricao").equals(""))) evento.setDescricao(request.getParameter("EVEdescricao"));
                if (request.getParameter("EVEtipo") != null && !(request.getParameter("EVEtipo").equals(""))) evento.setTipo(request.getParameter("EVEtipo"));
                if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null && !(request.getParameter("EVEhoraI").equals("")) && !(request.getParameter("EVEminI").equals(""))) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null && !(request.getParameter("EVEhoraT").equals("")) && !(request.getParameter("EVEminT").equals(""))) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null && !(request.getParameter("EVEdataD").equals("")) && !(request.getParameter("EVEdataM").equals("")) && !(request.getParameter("EVEdataY").equals(""))) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataM"))));
                if (request.getParameter("EVEmacro_evento") != null){
                    EventoDO macro2 = eventotn.buscarNome("EVEmacro_evento");
                    if (macro2 != null){
                        pertence = pertencetn.buscar(evento.getId());
                        pertence.setMacroId(macro2.getId());
                        boolean updatepertence = pertencetn.atualizar(pertence);
                    }
                }
                updateevento = eventotn.atualizar(evento);
            }
            if (request.getParameter("submit2") != null){
                if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals(""))) evento.setNome(request.getParameter("EVEnome"));
                if (request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEdescricao").equals(""))) evento.setDescricao(request.getParameter("EVEdescricao"));
                if (request.getParameter("EVEtipo") != null && !(request.getParameter("EVEtipo").equals(""))) evento.setTipo(request.getParameter("EVEtipo"));
                if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null && !(request.getParameter("EVEhoraI").equals("")) && !(request.getParameter("EVEminI").equals(""))) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null && !(request.getParameter("EVEhoraT").equals("")) && !(request.getParameter("EVEminT").equals(""))) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null && !(request.getParameter("EVEdataD").equals("")) && !(request.getParameter("EVEdataM").equals("")) && !(request.getParameter("EVEdataY").equals(""))) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataD"))));
                updateevento = eventotn.atualizar(evento);
            }
            if (updateevento == true){
                %>

                <center>
                    Evento modificado com sucesso.<BR><BR>
                </center>

                <%
            }
            boolean macro = evento.getMacroEvento();
            if(!macro){
    %>
    <div align = "left|justify">
        <form action = "EditarEvento.jsp" method = "post">
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
            if(macro){
    %>
    <div align = "left|justify">
        <form action = "EditarEvento.jsp" method = "post">
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
        }
        else{
            %>
            
            Erro ao buscar o evento.
            
            <%
        }
    %>
    </body>
</html>
