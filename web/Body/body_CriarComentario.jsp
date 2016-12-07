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
        <%
            Evento eventotn = new Evento();
            EventoDO evento = new EventoDO();
            if (request.getParameter("evento") != null) evento = eventotn.buscarNome(request.getParameter("evento"));
            if (evento.getNome() != null){
        %>
        <h1><center><%=evento.getNome()%></center></h1>

            <%
                //Verifica se o usuário está logado
                if (session.getAttribute("Usuario")!=null){
                    //Verifica se enviou o comentário
                    if (request.getParameter("submit") != null && !(request.getParameter("comentario").equals(""))){
                        ComentarioDO c = new ComentarioDO();
                        Comentario trc = new Comentario();
                        c.setMensagem(request.getParameter("comentario"));
                        %><%=request.getParameter("comentario")%><%           
                        int EVEid = evento.getId();
                        UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
                        int USUid = usuario.getId();
                        c.setUsuId(USUid);
                        c.setEveId(EVEid);
                        if (trc.incluir(c)){
                            pageContext.forward("index.jsp");
                        }
                    }
                    else if (request.getParameter("submit") != null && request.getParameter("comentario").equals("")){
                        pageContext.forward("index.jsp");
                    }
                    else if(request.getParameter("cancel") != null){
                        pageContext.forward("index.jsp");
                    }

                    else{
            %>
        <center>
            <form action="CriarComentario.jsp?evento=<%=evento.getNome()%>">
                <textarea name="comentario" rows="10" cols="55" maxlength="1000"></textarea>
                </center>
                <INPUT type="submit" name="submit" value= "Enviar Comentário">   
                <INPUT type="submit" name="cancel" value= "Cancelar">
            </form>
                <INPUT type="hidden" name="evento" value="<%= evento.getNome()%>">
            <%
                    }    
                }    
                else{
            %>
                <center>
                    Você precisa estar logado para comentar!
                </center>
            <%
                }
            }
            else pageContext.forward("index.jsp");
            %> 
    </body>
</html>
