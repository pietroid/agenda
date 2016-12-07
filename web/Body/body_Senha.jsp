<%-- 
    Document   : body_Senha
    Created on : 06/12/2016, 21:45:01
    Author     : Pedro
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@page import="data.UsuarioData"%>


<% UsuarioDO senha = (UsuarioDO)session.getAttribute("recup");
if(senha.getResposta().equals(request.getParameter("resposta")))
{
%>

    Sua senha é <%=senha.getSenha()%>
<%
}
else{
%>

    Resposta errada
    <Br>
    <FORM action="Recsenha.jsp" method="post" align = "left">
    <INPUT type="submit" name="submit" value= "Tente de Novo">
    <%           
}
%>