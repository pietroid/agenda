<%-- 
    Document   : body_Logout
    Created on : 06/12/2016, 16:25:17
    Author     : Pedro
--%>


<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@page import="data.UsuarioData"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Login <center> </h1>
<BR>


<%
UsuarioDO user=(UsuarioDO)session.getAttribute("Usuario");
if(user !=null){
    session.setAttribute("Usuario", null);
    }
    pageContext.forward("index.jsp");
%>


</center>
</body>
</html>
