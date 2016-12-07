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
    
    if(usuario != null){
    session.setAttribute("recup", usuario);
    pergunta = usuario.getPergunta();
    }
    else{
    %>
    Não há usuários com esse nome
    <BR>
    <FORM action="body_Recsenha.jsp" method="post" align = "left">
    UserName:<INPUT type="text" name="username" > 
    <br>
    <INPUT type="submit" name="submit" value= "Continuar">   
    <INPUT type="reset" name="reset" value= "Reset">
    <%
        }
    %>
    <FORM action="body_Recsenha.jsp" method="post" align = "left">
    Pergunta: <%= pergunta%>
    <BR> 
    Resposta: <INPUT type="text" name="resposta"> 
    <br>
    <INPUT type="submit" name="submit1" value= "Continuar">   
    <INPUT type="reset" name="reset" value= "Reset">
<%  
}else{%>
<FORM action="Recsenha.jsp" method="post" align = "left">
UserName:<INPUT type="text" name="username"  > 
<br>
<INPUT type="submit" name="submit" value= "Continuar">   
<INPUT type="reset" name="reset" value= "Reset"><%
}
   
if(request.getParameter("submit1")!= null){
       UsuarioDO user=(UsuarioDO)session.getAttribute("Usuario");
       String resposta = user.getResposta();
       String senha = user.getSenha();
        if(request.getParameter("resposta").equals(resposta)){
            %>
            <BR>
            Sua senha é <%=senha%>
            <%}
     else{
            %>
            <BR>
            Resposta errada
            <%}
    }
%>
<center>
</body>
</html>
