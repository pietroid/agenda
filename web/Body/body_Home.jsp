
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
 UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
 String nome = usuario.getNome();
%>

<h1><center> Home </center> </h1>

<h2><font face="verdana">Ol�,<%=nome%>  </font><h2>            
<h2><font face="verdana"> Grupos de extens�o </font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 

<%@include  file="Calendario/body_Calendario.jsp"%>

<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home </center> </h1>
 <h2><font face="verdana"> Grupos de extens�o </font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 

<%@include  file="Calendario/body_Calendario.jsp"%>

<%    
   }
%>
</font>
</body>
</html>