<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="data.UsuarioData"%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Recuperação de Senha <center> </h1>
<BR>
<center>
    
    
<%  UsuarioDO usuario = new UsuarioDO();
    Usuario u = new Usuario();
    String pergunta = "Usuário não cadastrado";
    
if (request.getParameter("submit") != null){
    usuario = u.buscarPorUsername(request.getParameter("username"));
    
    if(usuario != null && request.getParameter("submit1")==null){
    session.setAttribute("recup", usuario);
    pergunta = usuario.getPergunta();
    %>
    <FORM action="Senha.jsp" method="post" align = "left">
    Pergunta: <%= pergunta%>
    <BR> 
    Resposta: <INPUT type="text" name="resposta"> 
    <br>
    <INPUT type="submit" name="submit1" value= "Continuar">   
    <INPUT type="reset" name="reset" value= "Reset">
    
    <%
    }

    else{
    %>
    Não há usuários com esse nome ou, resposta errada
    <BR>
    <FORM action="Recsenha.jsp" method="post" align = "left">
    UserName:<INPUT type="text" name="username" > 
    <br>
    <INPUT type="submit" name="submit" value= "Continuar">   
    <INPUT type="reset" name="reset" value= "Reset">
    <%
        }
}
if(request.getParameter("submit")== null){
%>  
  <BR>
    <FORM action="Recsenha.jsp" method="post" align = "left">
    UserName:<INPUT type="text" name="username" > 
    <br>
    <INPUT type="submit" name="submit" value= "Continuar">   
    <INPUT type="reset" name="reset" value= "Reset">  
    <%
    }

%>
<center>
</body>
</html>
