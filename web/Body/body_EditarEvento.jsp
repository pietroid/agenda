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
    <body BGCOLOR =#EAD1A4>
        <%
            if ( request.getAttribute("EVEid") == null) {
               pageContext.forward("index.jsp");
            }
            int EVEid = Integer.parseInt((String)request.getAttribute("EVEid"));
            Evento eventotn = new Evento();
            EventoDO evento = new EventoDO();
            evento = eventotn.buscar(EVEid);
            int action = Integer.parseInt((String)request.getAttribute("EVEmacro_evento"));
            if(action != 0){%>
        <center>
          <FORM action="http://www.google.com.br/formtest" method="post">

              Nome do Evento:<BR>
            <INPUT type="text" name="EVEnome" value="Digite aqui o nome do seu evento"><BR><BR>
            Descrição:<BR>
            <INPUT type="text" name="EVEdescricao" value="Digite aqui uma breve descrição do seu evento"><BR><BR>
            Tipo:<BR>
            <INPUT type="text" name="EVEtipo" value="Digite o tipo do seu evento"><BR><BR>
            Horário de início:<BR>
            <INPUT type="text" name="EVEhorario_de_inicio" value="Digite aqui o horário de início do seu evento"><BR><BR>
            Horário de término:<BR>
            <INPUT type="text" name="EVEhorario_de_termino" value="Digite aqui o horário de término do seu evento"><BR><BR>
            Data:<BR>
            <INPUT type="text" name="EVEdata" value="Digite a data do seu evento"><BR><BR>
            Macro evento:<BR>
            <INPUT type="text" name="EVEmacro_evento" value="Digite a qual o macro evento o seu evento pertence"><BR><BR>
            <INPUT type="submit" name="submit" value="Submit">
            <INPUT type="reset" name="reset" value="Reset">
          </FORM>
        <BR><BR>
        </center>
        <% if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
           if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
           if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
           if (request.getParameter("EVEhorario_de_inicio") != null) evento.setHoraInicial(request.getParameter("EVEhorario_de_inicio"));
           if (request.getParameter("EVEhorario_de_termino") != null) evento.setHoraFinal(request.getParameter("EVEhorario_de_termino"));
           if (request.getParameter("EVEdata") != null) evento.setData(request.getParameter("EVEdata"));
           if (request.getParameter("EVEmacro_evento") != null){
               EventoDO macro = eventotn.buscarNome("EVEmacro_evento");
               evento.setMacroEvento(macro.getId());
           }
        }
        if(action == 0){%>
        <center>
          <FORM action="http://www.google.com.br/formtest" method="post">
              Nome do Evento:<BR>
            <INPUT type="text" name="EVEnome" value="Digite aqui o nome do seu evento"><BR><BR>
            Descrição:<BR>
            <INPUT type="text" name="EVEdescricao" value="Digite aqui uma breve descrição do seu evento"><BR><BR>
            Tipo:<BR>
            <INPUT type="text" name="EVEtipo" value="Digite o tipo do seu evento"><BR><BR>
            Horário de início:<BR>
            <INPUT type="text" name="EVEhorario_de_inicio" value="Digite aqui o horário de início do seu evento"><BR><BR>
            Horário de término:<BR>
            <INPUT type="text" name="EVEhorario_de_termino" value="Digite aqui o horário de término do seu evento"><BR><BR>
            Data:<BR>
            <INPUT type="text" name="EVEdata" value="Digite a data do seu evento"><BR><BR>
            <INPUT type="submit" name="submit" value="Submit">
            <INPUT type="reset" name="reset" value="Reset">
          </FORM>
        <BR><BR>
        </center>
        <% 
           if (request.getParameter("EVEnome") != null) evento.setNome(request.getParameter("EVEnome"));
           if (request.getParameter("EVEdescricao") != null) evento.setDescricao(request.getParameter("EVEdescricao"));
           if (request.getParameter("EVEtipo") != null) evento.setTipo(request.getParameter("EVEtipo"));
           if (request.getParameter("EVEhorario_de_inicio") != null) evento.setHoraInicial(request.getParameter("EVEhorario_de_inicio"));
           if (request.getParameter("EVEhorario_de_termino") != null) evento.setHoraFinal(request.getParameter("EVEhorario_de_termino"));
           if (request.getParameter("EVEdata") != null) evento.setData(request.getParameter("EVEdata"));
        }
        boolean update = eventotn.atualizar(evento);
        %>
    </body>
</html>
