<%-- 
    Document   : body_SolicitarAdesao
    Created on : Dec 5, 2016, 5:57:54 PM
    Author     : jujux
--%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.Membro" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.MembroDO" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Solicitar Ades�o</center></h1>
<BR><BR>
<%  UsuarioDO user= (UsuarioDO)session.getAttribute("Usuario");
    int IDuser = user.getId();
    Membro Mtr= new Membro();
    Usuario Utr= new Usuario();
    
    String IDge = request.getParameter("GEDO");
    
    MembroDO membro= new MembroDO();
    membro.setUSUid(IDuser);
    membro.setGEid(Integer.parseInt(IDge));
    
    boolean Espera = Mtr.incluir(membro);
    membro.setAprovado(0);
    
    if (Espera){ %> <th><center>A sua solicita��o foi feita com sucesso!<center></th>  <%}
else { %><th><center> Erro ao realizar solicita��o!<center></th> <%}
 
%>

</body>
</html>
