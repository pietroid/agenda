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
    <head>
        <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 50%;
    }
    td, th {
        height: 50px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }
    tr:nth-child(even){background-color: #f2f2f2;}
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    </style>
    </head> 
    <body>
        <h1><center>Reportar problema</center></h1>
        <%
        if (request.getParameter("submit") == null){
        %>
        <center>
        <form action="Reportar.jsp" method ="post">
            Descreva o problema (este texto será enviado à nossa equipe): <BR>
            <input type="text" name="report"><br><br>
            <INPUT type="submit" name="submit" value="Reportar">
        </form>
            
        <% } else {
                String action = request.getParameter("report");
                ProblemaDO problema = new ProblemaDO();
                if (session.getAttribute("Usuario")!=null){
                    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
                    Integer usuarioid = usuario.getId();
                    problema.setUserId(usuarioid);
                }
                if(action.equals("")){

             %><center><p>Por favor, descreva o problema detectado!</p></center><%

                }else{
                problema.setMensagem(action);
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate localDate = LocalDate.now();
                problema.setData(Date.valueOf(dtf.format(localDate)));
                Problema prob = new Problema();
                if ( prob.incluir(problema)){ %>
                <center><p>Report enviado com sucesso!</p></center>
                <%}
                }
            } %>
        </center>
    </body>
</html>
