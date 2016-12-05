<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<html>
<body BGCOLOR =#EAD1A4>
<h1> <center> Recuperação de Senha <center> </h1>
<BR>
<center>
<%@ page import="transacoes.Usuario" %>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="data.UsuarioData"%>

<% 
    UsuarioDO user = new UsuarioDO();
    Usuario u = new Usuario();
    String pergunta = "Usuário não cadastrado";
if (request.getParameter("submit") != null){
    user = u.buscarPorUsername(request.getParameter("username"));
    if (user == null){
%>

        Usuário e/ou senha incorretos.

<%
    }

    else{  
         pergunta = user.getPergunta(); 
        }
    }
%>
<FORM action="body_Recsenha" method="post" align = "left">
UserName:<INPUT type="text" name="username"  > 
<br>
Pergunta: <INPUT type="text" name="" value= "<%= pergunta%>">  
<br>
Resposta:<INPUT type="text" name="username" value= "Digite seu e-mail" > 
<br>

<INPUT type="submit" name="submit" value= "Submit">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>

<center>
</body>
</html>