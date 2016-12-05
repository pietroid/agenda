<%-- 
    Document   : body_CriarComentario
    Created on : 04/12/2016, 13:10:09
    Author     : LUIS FELIPE
--%>

<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ComentarioDO"%>
<%@page import="transacoes.Comentario"%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.ComentarioDO" %>
<%@ page import="transacoes.Comentario"%>
<%@ page import="java.util.Vector" %>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Nome do Evento</center></h1>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <BR>
    <center>
    
    <%
    //Verifica se o usuário está logado
    if (session.getAttribute("Usuario")!=null){
        //Verifica se enviou o comentário
        if (request.getParameter("submit") != null){
            //UsuarioDO usuario = session.getAtribute("Usuario");
            ComentarioDO c = new ComentarioDO();
            Comentario trc = new Comentario();
            c.setMensagem(request.getParameter("comentario"));
            pageContext.forward("body_Evento.jsp");
        }
        else{
    %>
    Você precisa estar logado para escrever um comentário.
    <%}
        }
    }
    %>
    
    Digite seu comentário:
    <form>
	<textarea rows="10" cols="55" maxlength="1000"></textarea>
    </center>
    <INPUT type="submit" name="comentario" value= "Enviar Comentário">   
    <INPUT type="reset" name="cancelar" value= "Cancelar">
	</form><BR>
</center>    
</body>
</html>
<% 
        
    }
%>
}