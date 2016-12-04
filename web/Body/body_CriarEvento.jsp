<%-- 
    Document   : body_CriarEvento
    Created on : 02/12/2016, 17:36:54
    Author     : fernandohitoshiwatanabe
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <h1><center>Criar Evento<center></h1>
    <BR>
    <center>
    <form>
        Selecione se o evento é macro ou micro: <BR><BR>
        <input type="radio" name="Eve" value="macro" checked> Macro<br>
        <input type="radio" name="Eve" value="micro"> Micro<br>
        <INPUT type="submit" name="submit1" value= "Ok"><BR><BR>
    </form>
    </center>
    <% 
        if (request.getParameter("submit1") != null){
            String action = request.getParameter("Eve");
            Evento eventotn = new Evento();
            EventoDO evento = new EventoDO();
            if(action.equals("micro")){
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
            <INPUT type="submit" name="submit" value="Submit">
            <INPUT type="reset" name="reset" value="Reset">
        </FORM>
        <BR><BR>
    </div>
    <%  
                if (request.getParameter("submit") != null){
                    evento.setNome(request.getParameter("EVEnome"));
                    evento.setDescricao(request.getParameter("EVEdescricao"));
                    evento.setTipo(request.getParameter("EVEtipo"));
                    evento.setHoraInicial(request.getParameter("EVEhoraI") + ":" + request.getParameter("EVEminI"));
                    evento.setHoraFinal(request.getParameter("EVEhoraT") + ":" + request.getParameter("EVEminT"));
                    evento.setData(request.getParameter("EVEdataD") + "/" + request.getParameter("EVEdataM") + "/" + request.getParameter("EVEdataY"));
                    if (request.getParameter("EVEmacro_evento") != null){
                         EventoDO macro = eventotn.buscarNome("EVEmacro_evento");
                         evento.setMacroEvento(macro.getId());
                    }
                    boolean ok = eventotn.incluir(evento);
                }
            }
            if(action.equals ("macro")){
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
            <INPUT type="submit" name="submit" value="Submit">
            <INPUT type="reset" name="reset" value="Reset">
        </FORM>
        <BR><BR>
    </div>
    <%  
                if (request.getParameter("submit") != null){
                    evento.setNome(request.getParameter("EVEnome"));
                    evento.setDescricao(request.getParameter("EVEdescricao"));
                    evento.setTipo(request.getParameter("EVEtipo"));
                    evento.setHoraInicial(request.getParameter("EVEhoraI") + ":" + request.getParameter("EVEminI"));
                    evento.setHoraFinal(request.getParameter("EVEhoraT") + ":" + request.getParameter("EVEminT"));
                    evento.setData(request.getParameter("EVEdataD") + "/" + request.getParameter("EVEdataM") + "/" + request.getParameter("EVEdataY"));
                    evento.setMacroEvento(0);
                    boolean ok = eventotn.incluir(evento);
                }
            } 
        }
    %>
    </body>
</html>
