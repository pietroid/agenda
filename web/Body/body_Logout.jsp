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
       session.setAttribute("Usuario", null);    
       
       pageContext.forward("body_LoginOut.jsp");
       %>
    </head>
<body BGCOLOR =#EAD1A4>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<h1><center>Saindo</center></h1>



 </body>
 </html>
