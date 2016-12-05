<%-- 
    Document   : body_CriarEvento
    Created on : 05/12/2016, 17:36:54
    Author     : Marcus
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
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
    <form action = "CriarEvento.jsp" method = "post">
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
            boolean campospreenchidos = true;
            boolean ok = false;
            Evento eventotn = new Evento();
            EventoDO evento = new EventoDO();
            GEDO ge = (GEDO)session.getAttribute("GEDO");
            GE getn = new GE();
            RealizaDO realiza = new RealizaDO();
            Realiza realizatn = new Realiza();
            Pertence pertencetn = new Pertence();
            PertenceDO pertence = new PertenceDO();
            if (request.getParameter("submit").equals("Enviar micro")){
                if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEtipo") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEhoraI") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEminI") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEhoraT") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEminT") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataD") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataM") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataY") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEmacro_evento") != null && !(request.getParameter("EVEnome").equals("")))
                {
                    evento.setNome(request.getParameter("EVEnome"));
                    evento.setDescricao(request.getParameter("EVEdescricao"));
                    evento.setTipo(request.getParameter("EVEtipo"));
                    evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                    evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                    evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
                    evento.setMacroEvento(true);
                    ok = eventotn.incluir(evento);
                    if (ok == true){
                        if (ge != null){
                            realiza.setEVEid(eventotn.buscarNome(evento.getNome()).getId());
                            realiza.setGEid(ge.getId());
                            boolean realizaok = realizatn.incluir(realiza);
                        }
                        if (eventotn.buscarNome(request.getParameter("EVEmacro_evento")) != null){
                            EventoDO macro = eventotn.buscarNome(request.getParameter("EVEmacro_evento"));
                            pertence.setMicroId(eventotn.buscarNome(evento.getNome()).getId());
                            pertence.setMacroId(macro.getId());
                            boolean pertenceok = pertencetn.incluir(pertence);
                        }
                    }
                }
                else{
                    campospreenchidos = false;
                }
            }
            if (request.getParameter("submit").equals("Enviar macro")){
                if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEtipo") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEhoraI") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEminI") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEhoraT") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEminT") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataD") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataM") != null && !(request.getParameter("EVEnome").equals("")) &&
                    request.getParameter("EVEdataY") != null && !(request.getParameter("EVEnome").equals("")))
                {
                    evento.setNome(request.getParameter("EVEnome"));
                    evento.setDescricao(request.getParameter("EVEdescricao"));
                    evento.setTipo(request.getParameter("EVEtipo"));
                    evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                    evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                    evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataD")), Integer.valueOf(request.getParameter("EVEdataM")), Integer.valueOf(request.getParameter("EVEdataY"))));
                    evento.setMacroEvento(false);
                    ok = eventotn.incluir(evento);
                    if (ok == true){
                        if (ge != null){
                            realiza.setEVEid(eventotn.buscarNome(evento.getNome()).getId());
                            realiza.setGEid(ge.getId());
                            boolean realizaok = realizatn.incluir(realiza);
                        }
                    }
                }
                else{
                    campospreenchidos = false;
                }
            }
            if (campospreenchidos == false){
                %>

                <center>
                    Preencher todos os campos!
                </center>

                <%
            }
            if (ok == true && campospreenchidos == true){
                %>

                    <center>
                        Evento criado com sucesso.
                    </center>

                <%
            }
            if((action != null) && action.equals("micro")){
    %>
    <div align = "left|justify">
        <FORM action = "CriarEvento.jsp" method = "post">
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
            <INPUT type="submit" name="submit" value="Enviar micro"><BR><BR>
        </FORM>
        <BR><BR>
    </div>
    <%  
            }
            if((action != null) && action.equals ("macro")){
    %>
    <div align = "left|justify">
        <FORM action = "CriarEvento.jsp" method = "post">
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
    %>
    </body>
</html>
