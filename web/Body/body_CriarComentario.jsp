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
            ComentarioDO c = new ComentarioDO();
            Comentario trc = new Comentario();
            c.setMensagem(request.getParameter("comentario"));
            %><%=request.getParameter("comentario")%><%
            Evento eventotn = new Evento();
            int EVEid = eventotn.buscarNome(request.getParameter("evento")).getId();
            UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
            int USUid = usuario.getId();
            c.setUsuId(USUid);
            c.setEveId(EVEid);
            if (trc.incluir(c)){
                pageContext.forward("index.jsp");
            }
        }
        else if(request.getParameter("reset") != null){
            pageContext.forward("Eventos.jsp");
        }

        else{
    %>
        Digite seu comentário: id é <%=request.getParameter("evento")%>
        <form>
	<textarea name="comentario" rows="10" cols="55" maxlength="1000"></textarea>
        </center>
        <INPUT type="submit" name="submit" value= "Enviar Comentário">   
        <INPUT type="reset" name="reset" value= "Cancelar">
        <INPUT type="hidden" name="evento" value="<%=request.getParameter("evento")%>">
	</form><BR>
    <%
        }    
    }    
    else{
    %>
    Você precisa estar logado para comentar!
    <%
    }
    %>
    
    
</center>    
</body>
</html>