<%-- 
    Document   : CriarComentario
    Created on : 04/12/2016, 13:10:09
    Author     : LUIS FELIPE
--%>

<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ComentarioDO"%>
<%@page import="transacoes.Comentario"%>
<%@page import="transacoes.Evento"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Vector" %>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center><%=request.getParameter("comentario")%></center></h1>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <%
            Evento eventotn = new Evento();
            int EVEid = eventotn.buscarNome(request.getParameter("evento")).getId();
            UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
            int USUid = usuario.getId();
            c.setUsuId(USUid);
            c.setEveId(EVEid);
            if (trc.incluir(c)){
                pageContext.forward("index.jsp");
            }
            else pageContext.forward("index.jsp");
            %> 
    </body>
</html>
