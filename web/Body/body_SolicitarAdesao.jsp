<%-- 
    Document   : body_SolicitarAdesao
    Created on : Dec 5, 2016, 5:57:54 PM
    Author     : jujux
--%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.RequisicaoMembro" %>
<%@ page import="data.RequisicaoMembroDO" %>
<%@ page import="java.util.Vector" %>

<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Solicitar Adesão</center></h1>
<BR><BR>
<%  RequisicaoMembroDO user= (RequisicaoMembroDO)session.getAttribute("Usuario");
    RequisicaoMembro RMtr = new RequisicaoMembro();
    boolean RegIn = RMtr.incluir(user);
    
        if (RegIn){ %> A sua solicitação foi feita com sucesso!  <%}
        else { %>Erro ao realizar solicitação! <%}
 
%>

</body>
</html>
