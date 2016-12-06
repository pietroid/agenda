<html>
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Excluir minha conta <center> </h1>
<BR>
<BR>
<p>Digite sua senha para excluir sua conta. ESTA AÇÃO NÃO PODE SER DESFEITA!</p>
<center>

    <%
        UsuarioDO us = new UsuarioDO();
        us = (UsuarioDO)session.getAttribute("Usuario");
        Usuario user = new Usuario();
        
        
        %>
<FORM action="excluirMembro.jsp" method="post">
    Senha:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>
<INPUT type="submit" name="submit" value= "Excluir minha conta">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
    <%
        String atual = request.getParameter("senhaAtual");
        if (us.getSenha().equals(atual)){
            user.excluir(us);
            session.setAttribute("Usuario", null); 
            %><p>Sua conta foi excluída com sucesso!</p><%
        }else{
%><p>Senha atual incorreta!</p><%
        };
        
        %>

<center>
</body>
</html>