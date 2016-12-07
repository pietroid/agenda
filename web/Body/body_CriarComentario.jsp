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

<%
    if (request.getParameter("evento") != null){
        Evento eventotn = new Evento();
        EventoDO evento = eventotn.buscar(Integer.valueOf(request.getParameter("evento")));
%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Comentar no evento: <%=evento.getNome()%></center></h1>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <BR>
    <center>
    
    <%
    //Verifica se o usuário está logado
    if (session.getAttribute("Usuario")!=null){
        //Verifica se enviou o comentário
        if (request.getParameter("submit") != null && !(request.getParameter("comentario").equals(""))){
            ComentarioDO c = new ComentarioDO();
            Comentario trc = new Comentario();
            c.setMensagem(request.getParameter("comentario"));
            int EVEid = evento.getId();
            UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
            int USUid = usuario.getId();
            c.setUsuId(USUid);
            c.setEveId(EVEid);
            if (trc.incluir(c)){
                pageContext.forward("Evento.jsp?evento=" + String.valueOf(EVEid));
            }
        }
        else if (request.getParameter("submit") != null && request.getParameter("comentario").equals("")){
            %>
            <center>
                Digite algum comentário.
            </center>
            <%
        }
        else{
    %>
    <center>
        Digite seu comentário:
        <BR>
        <form action = "CriarComentario.jsp?evento=<%=evento.getId()%>" method = "post">
            <textarea name="comentario" rows="10" cols="55" maxlength="1000"></textarea>
            <BR>
            <INPUT type="submit" name="submit" value= "Enviar Comentário">
            <input type ="reset" name="reset" value="Reset">
            <INPUT type="hidden" name="evento" value="<%=request.getParameter("evento")%>">
	</form><BR>
    </center>
    <%
        }    
    }    
    else{
    %>
    Você precisa estar logado para comentar!
    <%
    }
}
else pageContext.forward("index.jsp");
    %>
    
    
</center>    
</body>
</html>