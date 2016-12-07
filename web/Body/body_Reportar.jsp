<%-- 
    Document   : body_Reportar
    Created on : Dec 5, 2016, 3:49:32 PM
    Author     : Michael
--%>
<%@page import="transacoes.Problema"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="data.ProblemaDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1><center>Reportar problema></center></h1>
        <%
        if (request.getParameter("submit") == null){
        %>
        <form action='Reportar.jsp' method ='post'>
            Descreva o problema (este texto será enviado à nossa equipe): <BR><BR>
            <input type="text" name="report"\><br><br>
            
        <% } else{
                String action = request.getParameter("report");
                ProblemaDO problema = new ProblemaDO();
                if (session.getAttribute("Usuario")!=null){
                    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
                    Integer usuarioid = usuario.getId();
                    problema.setUserId(usuarioid);
                }
                problema.setMensagem(action);
                if(!request.getParameter("ano").equals("")){ 
                    Date dt = Date.valueOf(request.getParameter("ano")+"-01-01");
                    problema.setData(dt);
                }
                Problema prob = new Problema();
                if (prob.incluir(problema)){ %>
                <h2><center>Report enviado com sucesso!</center></h2>
                <% } %>
    </body>
</html>
