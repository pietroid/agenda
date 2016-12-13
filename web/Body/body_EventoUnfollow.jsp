<%-- 
    Document   : body_EventoUnfollow
    Created on : 13/12/2016, 15:34:39
    Author     : daniel
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.EventoDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="java.util.Vector" %>
<%@page import="transacoes.Seguindo"%>
<%@page import="data.SeguindoDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
    if ((request.getParameter("eve")) != null) {
        SeguindoDO seguindo = new SeguindoDO();
        Seguindo seguindotn = new Seguindo();
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
        Evento eventotn = new Evento();
        EventoDO evento = eventotn.buscar(Integer.parseInt(request.getParameter("eve")));
        List<SeguindoDO> verificaSeUsuarioJaSegueEvento = seguindotn.pesquisarPorUSUid(usuario.getId());
        int i = 0;
        boolean segue = false; //booleana para verificar se o usuario segue ja segue o evento
        for (i = 0; i < verificaSeUsuarioJaSegueEvento.size() && segue == false; i++) {
            if (verificaSeUsuarioJaSegueEvento.get(i).getEveId() == evento.getId()) {
                seguindo = verificaSeUsuarioJaSegueEvento.get(i);
                segue = true;
            }
        }
        
        if (segue == false) {
        %>
        <h1 align ="center">
            Você ainda não é um seguidor desse evento!
        </h1>
        <BR>
        <a href ="Evento.jsp?evento=<%=evento.getId()%>">Clique aqui para voltar à página do evento</a>
        <%   
        }
        else { 
            if (seguindotn.excluir(seguindo)) {
    %>
            <h1 align="center">
                Você agora não é mais um seguidor do evento <%=evento.getNome()%>!
            </h1>
            <a href ="Evento.jsp?evento=<%=evento.getId()%>">Clique aqui para voltar à página do evento</a>
    <%
            }
            else {
    %>
    Houve um erro! <BR>
        <a href ="Evento.jsp?evento=<%=evento.getId()%>">Clique aqui para voltar à página do evento</a>
    <%
            }
        }
    }
    %>
</html>
