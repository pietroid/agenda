<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>


<%
    if(session.getAttribute("Usuario")!= null)
    {
 UsuarioDO superuser = (UsuarioDO)session.getAttribute("Usuario");
 String nome = superuser.getNome();
%>
<h1><center> Painel de controle <center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>
        
        
        
        
        
<h2><font face="verdana"> Interesses </font><h2>
        
        
 
        
<p><font size="2" face="verdana"><a href="/agenda/body_GE.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 

<p><font size="2" face="verdana"><a href="/agenda/AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>
<p><font size="2" face="verdana"><a href="/agenda/body_excluirMembro.jsp">Clique aqui
 para remover uma conta </a> </font></p>

<table align="left" border=1 cellpadding=10 width=500>
<th colspan="2">Notificações</th>
<tr>
  <td><a href="/agenda/Problemas.jsp"  target="_top"><font size="3" >Problemas do Sistema</font></a></td>
  <td><a href="/agenda/Solicitações.jsp"  target="_top"><font size="3">Solicitações</font></a></td>
</tr>
</table>
 <BR><BR><BR><BR>
<table align="left" border=1 cellpadding=10 width=500>
<th colspan="2">Pontos de Interesse</th>    
 <BR><th <p><font size="2" face="verdana"><a href="/agenda/body_GE.jsp">Clique aqui
 para ver uma lista com todos os Pontos de Interesse</a></font></p> </th>    
<tr>
  <td><a href="/agenda/Cadastro_POI.jsp"  target="_top"><font size="3">Cadastrar Ponto de Interesse</font></a></td>
  <td><a href="/agenda/ListaPOI.jsp"  target="_top"><font size="3" >Alterar Ponto de Interesse</font></a></td>
  <td><a href="/agenda/ListaPOI.jsp"  target="_top"><font size="3">Excluir Ponto de Interesse</font></a></td>
</tr>
</table>
 <BR>
 
 <%
   }
%>
 
</font>
</body>
</html>
