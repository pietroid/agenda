<%-- 
    Document   : CriarComentario
    Created on : 04/12/2016, 13:10:09
    Author     : LUIS FELIPE
--%>

<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ComentarioDO"%>
<%@page import="transacoes.Comentario"%>
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
            int usuarioid = 0;
            int eventoid = 0;
            ComentarioDO c = new ComentarioDO();
            Comentario trc = new Comentario();
            c.setMensagem(request.getParameter("comentario"));
            %>
            <a href="Evento.jsp?USUid=<%=usuarioid%>&EVEid=<%=eventoid%>"></a>
            <%
            c.setUsuId(usuarioid);
            c.setEveId(eventoid);
            if (trc.incluir(c)){
                pageContext.forward("PaineldeControle.jsp");
            }
        }
        else{
    %>
        Digite seu comentário:
        <form>
	<textarea name="comentario" rows="10" cols="55" maxlength="1000"></textarea>
        </center>
        <INPUT type="submit" name="submit" value= "Enviar Comentário">   
        <INPUT type="reset" name="reset" value= "Cancelar">
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