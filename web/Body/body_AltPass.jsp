<html>
    
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Senha </center> </h1>
<BR>
    
    
    <%    
        UsuarioDO us = new UsuarioDO();
        us = (UsuarioDO)session.getAttribute("Usuario");
        System.out.println("parte 1 ok");
        
        if(request.getParameter("submit")==null){%>
<FORM action="body_altpass.jsp" method="post">
Senha Atual:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>
Nova Senha<BR><INPUT type="password" name="novaSenha" value= ""> <BR><BR>
Repita a Nova Senha<BR><INPUT type="password" name="repNovaSenha" value= ""> <BR><BR>
<INPUT type="submit" name="submit" value= "Submit">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<center>
    <%
        String atual = request.getParameter("senhaAtual");
        String nova1 = request.getParameter("novaSenha");
        String nova2 = request.getParameter("repNovaSenha");
        if (us.getSenha().equals(atual)){
            if (nova1.equals(nova2)){
                us.setSenha(nova1);
                %>
                <p> Senha alterada com sucesso!</p>
                <%
            } else{
                %><p>Novas senha e sua verificação não batem! Digite uma nova senha e confirme.</p><%
            }
        }else{
%><p>Senha atual incorreta! Você precisa digitar a senha atual para mudá-la.</p><%
        };
        
        %>

</center>
</body>
</html>