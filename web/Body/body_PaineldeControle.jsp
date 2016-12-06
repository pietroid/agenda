<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>

<%
    if(session.getAttribute("Usuario")!= null)
    {
 UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
 String nome = usuario.getNome();
%>
<h1><center> Painel de controle <center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>
        
        
        
        
        
<h2><font face="verdana"> Interesses </font><h2>
<p><font size="2" face="verdana"><a href="body_GE.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 

<p><font size="2" face="verdana"><a href="AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>
<p><font size="2" face="verdana"><a href="body_excluirMembro.jsp">Clique aqui
 para remover sua conta/a></font></p>


    
 <%
    } PontoDeInteresse poitn = new PontoDeInteresse();
    PontoDeInteresseDO poi = (PontoDeInteresseDO)request.getAttribute("POIDO");
%>

<table align="left" border=1 cellpadding=10 width=500>
<tr>
  <td><a href="/agenda/Cadastro_POI.jsp"  target="_top"><font size="3" color="#ff0000">Cadastrar Ponto de Interesse</font></a></td>
  <td><a href="/agenda/AlterarPOI.jsp"  target="_top"><font size="3" color="#ff0000">Alterar Ponto de Interesse</font></a></td>
  <td><a href="/agenda/ExcluirPOI.jsp"  target="_top"><font size="3" color="#ff0000">Excluir Ponto de Interesse</font></a></td>
</tr>
</table>

<%@include  file="Calendario/body_Calendario.jsp"%>


</font>
</body>
</html>
