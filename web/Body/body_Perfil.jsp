<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>


<%
    if(session.getAttribute("Usuario")!= null)
    {
 UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
 String nome = usuario.getNome();
%>
<h1><center> Perfil <center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>
<h2><font face="verdana"> Interesses </font><h2>
<p><font size="2" face="verdana"><a href="GE.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 

<p><font size="2" face="verdana"><a href="AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>

<p><font size="2" face="verdana"><a href="body_excluirMembro.jsp">Clique aqui
 para remover sua conta</a></font></p>

<%@include  file="Calendario/body_Calendario.jsp"%>
    
<%    
   }else{

 %>
 
 <h1><center> Você ainda não tem um Perfil.<center> </h1>
 <h2><center>      Deseja se cadastrar?    <center> </h2>
<center>  <BR><a href="Cadastro.jsp" target="_top">Quero me Cadastrar</a><center>
 <%      

    }
        
        
%>
</font>
</body>
</html>
