<%-- 
    Document   : ExcluirEvento
    Created on : 03/12/2016, 18:24:01
    Author     : Marcus;
--%>

<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="transacoes.Comentario" %>
<%@ page import="data.ComentarioDO" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
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
            UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
            if(usuario!=null){%><%=usuario.getId()%><%
                Usuario ustn=new Usuario();
                if(ustn.excluir(usuario)){%>
        Usuario excluido com sucesso!<%
            }
            }else{
                pageContext.forward("Perfil.jsp");
            }
            %>
    </body>
</html>
