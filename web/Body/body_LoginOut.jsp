<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Login <center> </h1>
<BR>

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<center>

<% 
if (request.getParameter("submit") != null){
    UsuarioDO usuario;
    Usuario tru = new Usuario();
    usuario=tru.buscarPorUsername(request.getParameter("login"));
    if (usuario!=null && usuario.getSenha().equals(request.getParameter("senha"))){
        session.setAttribute("Usuario", usuario);  //Decidir com os demais 
        if( usuario.isSuperUser()== false){
        pageContext.forward("Perfil.jsp");
        }else{
            pageContext.forward("PaineldeControle.jsp");
        }
        
    }
    else
    {
%>

        Usuário e/ou senha incorretos.

<%
    }
}
%>
<FORM action="index.jsp" method="post">
Usuário:<BR><INPUT type="text" name="login" value= ""> <BR><BR>
Senha:<BR><INPUT type="password" name="senha" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Login">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<BR><a href="/agenda/Recsenha.jsp" target="_top">Esqueceu sua senha?</a>
<BR><a href="/agenda/Cadastro.jsp" target="_top">Fazer cadastro</a>
</center>
</body>
</html>
