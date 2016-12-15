<%-- 
    Document   : CriarComentario
    Created on : 07/12/2016, 03:07:43
    Author     : Marcus
--%>

<%@page import="data.RealizaDO"%>
<%@page import="transacoes.Realiza"%>
<%@page import="data.MembroDO"%>
<%@page import="transacoes.Membro"%>
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
        <h1>Cancelar evento</h1>
        <%
            UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
            String evstr = request.getParameter("evento");

            if (evstr != null && usuario != null) {
                Membro membrt = new Membro();
                Realiza rlzt = new Realiza();
                RealizaDO realiza = rlzt.buscarPorEVE(Integer.parseInt(evstr));
                boolean isadm = membrt.isADM(realiza.getGEid(), usuario.getId());
                if (usuario.isSuperUser() || isadm) {
                    if (request.getParameter("submit") == null) {
        %>
    <center>
        <form action="CancelarEvento.jsp" method="post">
            <p>Você tem certeza que quer cancelar o evento?</p> <br> <br>
            <input type="submit" name="submit" value="Sim"> 
            <input type="submit" name="submit" value="Não"> 
            <input type="hidden" name="evento" value="<%=request.getParameter("evento")%>"> 
        </form>
    </center>
    <%} else {
                if (request.getParameter("submit").equals("Sim")) {
                    Evento evnt=new Evento();
                    EventoDO evento=evnt.buscar(Integer.parseInt(request.getParameter("evento")));
                    evento.setAtivo(false);
                    evnt.atualizar(evento);
                    %><p>Evento cancelado!</p><%
                } else {
                    pageContext.forward("Evento.jsp?evento="+request.getParameter("evento"));
                }
            }
        } else {
            pageContext.forward("index.jsp");
                        }
                    } else {
    pageContext.forward("index.jsp");
    }%>
</body>
</html>
