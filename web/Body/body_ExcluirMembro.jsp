<html>
    
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Excluir sua Conta </center> </h1>
<BR>
    
    
    <%    
        UsuarioDO us = new UsuarioDO();
        us = (UsuarioDO)session.getAttribute("Usuario");
        Usuario tr = new Usuario();
        
        
        if(request.getParameter("submit")==null){%>
<FORM action="ExcluirMembro.jsp" method="post" id = "deleteForm">
Digite sua senha:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>
</FORM>
<INPUT type ="submit" name="submit" value= "Submit" form="deleteForm">   
<INPUT type ="reset" name="reset" value= "Reset" form = "deleteForm">
    <%
        } else if (request.getParameter("submit").equals("Submit")){
        
        String atual = request.getParameter("senhaAtual");
        
        if (us.getSenha().equals(atual)){
            tr.excluir(us);
            session.setAttribute("Usuario", null);
%><p>Sua conta foi removida.</p><%
        }else{
%><p>Senha atual incorreta! Você precisa digitar a senha atual excluir sua conta.</p><%
        }}
        
        %>

</center>
</body>
</html>