<%-- 
    Document   : ExcluirEvento
    Created on : 03/12/2016, 18:24:01
    Author     : Marcus;
--%>

<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
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
        <% 
            if (request.getParameter("submit") != null){
                if (session.getAttribute("evento") != null) {
                    String action = request.getParameter("Eve");
                    Pertence pertencetn = new Pertence();
                    Realiza realizatn = new Realiza();
                    EventoDO evento = (EventoDO) session.getAttribute("evento");
                    Evento eventotn = new Evento();
                    if(action.equals("sim")){
                        if (evento.getMacroEvento() == true){
                            List<Integer> microIds = pertencetn.buscarMicroPorMacro(evento);
                            for(int i = 0; i < microIds.size(); i++){
                                realizatn.excluirPorEVEid(microIds.get(i));
                                eventotn.excluir(eventotn.buscar(microIds.get(i)));
                            }
                            pertencetn.excluirPorMacro(evento.getId());
                            realizatn.excluirPorEVEid(evento.getId());
                            eventotn.excluir(evento);
                        }
                        else{
                            pertencetn.excluirPorMicro(evento.getId());
                            realizatn.excluirPorEVEid(evento.getId());
                            eventotn.excluir(evento);
                        }
        %>
                    <center>
                        Evento excluído. <BR>
                    </center>

                <%
                }
                if(action.equals("nao")){
                %>

                    <center>
                        Evento não exclúido. <BR>
                    </center>

                <%
                }
            }
        %>
        <center>
            Deseja excluir o evento?
            <form>
                <input type="radio" name="Eve" value="sim" checked> Sim<br>
                <input type="radio" name="Eve" value="nao"> Não<br>
                <INPUT type="submit" name="submit" value= "Excluir">   
                <INPUT type="reset" name="reset" value= "Voltar">
            </form>
        </center>
    </body>
</html>
