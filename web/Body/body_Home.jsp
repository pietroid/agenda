
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@page import="data.EventoDO"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.Seguindo" %>
<%@ page import="data.SeguindoDO" %>

<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
 UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
 String nome = usuario.getNome();
%>

<h1><center> Home </center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>            
<h2><font face="verdana"> Grupos de extensão </font><h2>
<p><font size="2" face="verdana"><a href="/agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extensão</a></font></p> 


<%
    SeguindoDO seguindo = new SeguindoDO();
    Seguindo seguindotn = new Seguindo();
    List<EventoDO> lista = seguindotn.pesquisarPorUSUid(usuario.getId());
    for (EventoDO evento : lista){ 
        String nomeEven = evento.getNome(); 
%>
    <tr>
        <td> <%=nomeEven%> </td>
    </tr>
    
    <%}

%>


<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home </center> </h1>
 <h2><font face="verdana"> Grupos de extensão </font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extensão</a></font></p> 

<%@include  file="Calendario/body_Calendario.jsp"%>


<%    
   }
%>
</font>
</body>
</html>
