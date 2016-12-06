<%-- 
    Document   : body_Logout
    Created on : 03/12/2016, 16:37:04
    Author     : Pedro
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

    <head>
       <%
       if((UsuarioDO)session.getAttribute("Usuario")!=null){
       session.setAttribute("Usuario", null);
       }
       
       
       %>
    </head>
<body BGCOLOR =#EAD1A4>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<h1><center>Saindo</center></h1>

<%
    pageContext.forward("index.jsp");
    %>

 </body>
 </html>
