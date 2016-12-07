<%-- 
    Document   : body_SolicitarAdesao
    Created on : Dec 5, 2016, 5:57:54 PM
    Author     : jujux
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="java.util.Vector" %>

<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Solicitar Adesão</center></h1>
<BR><BR>
<%  MembroDO user= (MembroDO)session.getAttribute("Usuario");
    Membro Mtr= new Membro();
    boolean Espera = Mtr.incluir(user);
    user.setAprovado(0);
    
        if (Espera){ %> A sua solicitação foi feita com sucesso!  <%}
        else { %>Erro ao realizar solicitação! <%}
 
%>

</body>
</html>
