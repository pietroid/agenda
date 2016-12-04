<%-- 
    Document   : body_CriarEvento
    Created on : 02/12/2016, 17:36:54
    Author     : fernandohitoshiwatanabe
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <h1><center>Criar Evento<center></h1>
    <BR>
    <%
        if (request.getParameter("submit") == null){
    %>
    <center>
    <form action = "body_CriarEvento.jsp" methd = "post">
        Selecione se o evento é macro ou micro: <BR><BR>
        <input type="radio" name="Eve" value="macro" checked> Macro<br>
        <input type="radio" name="Eve" value="micro"> Micro<br>
        <INPUT type="submit" name="submit" value= "Ok"><BR><BR>
    </form>
    </center>
    <% 
        }
        else{
            String action = request.getParameter("Eve");
            Evento eventotn = new Evento();
            EventoDO evento = new EventoDO();
            Pertence pertencetn = new Pertence();
            PertenceDO pertence = new PertenceDO();
            if (request.getParameter("submit").equals("Enviar micro")){
                evento.setNome(request.getParameter("EVEnome"));
                evento.setDescricao(request.getParameter("EVEdescricao"));
                evento.setTipo(request.getParameter("EVEtipo"));
               evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
                if (request.getParameter("EVEmacro_evento") != null){
                     EventoDO macro = eventotn.buscarNome("EVEmacro_evento");
                     evento.setMacroEvento(macro.getNome());
                }
                boolean ok = eventotn.incluir(evento);
                if (ok == true){
                    pertence.setMicroId(eventotn.buscarNome(evento.getNome()).getId());
                    pertence.setMacroId(eventotn.buscarNome(evento.getMacroEvento()).getId());
                    boolean pertenceok = pertencetn.incluir(pertence);
                }
            }
            if (request.getParameter("submit").equals("Enviar macro")){
                evento.setNome(request.getParameter("EVEnome"));
                evento.setDescricao(request.getParameter("EVEdescricao"));
                evento.setTipo(request.getParameter("EVEtipo"));
                evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
                evento.setMacroEvento("");
                boolean ok = eventotn.incluir(evento);
            }
            if(action != null){
                if(action.equals("micro")){
    %>
    <div align = "left|justify">
        <FORM action = "body_CriarEvento.jsp" method = "post">
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
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR><BR>
            Macro evento:
            <INPUT type="text" name="EVEmacro_evento"> <BR>
            <INPUT type="submit" name="submit" value="Enviar micro"><BR><BR>
        </FORM>
        <BR><BR>
    </div>
    <%  
                }
                if(action.equals ("macro")){
    %>
    <div align = "left|justify">
        <FORM action = "body_CriarEvento.jsp" method = "post">
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
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR><BR>
            <INPUT type="submit" name="submit" value="Enviar macro"><BR><BR>
        </FORM>
        <BR><BR>
    </div>
    <%  
                } 
            }
        }
    %>
    </body>
</html>
