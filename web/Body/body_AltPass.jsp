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
        Usuario tr = new Usuario();
        
        
        if(request.getParameter("submit")==null){%>
<FORM action="body_AltPass.jsp" method="post" id = "changePassForm">
Senha Atual:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>
Nova Senha<BR><INPUT type="password" name="novaSenha" value= ""> <BR><BR>
Repita a Nova Senha<BR><INPUT type="password" name="repNovaSenha" value= ""> <BR><BR>
</FORM>
<INPUT type ="submit" name="submit" value= "Submit" form="changePassForm">   
<INPUT type ="reset" name="reset" value= "Reset" form = "changePassForm">
    <%
        } else if (request.getParameter("submit").equals("Submit")){
        

        String atual = request.getParameter("senhaAtual");
        String nova1 = request.getParameter("novaSenha");
        String nova2 = request.getParameter("repNovaSenha");
        
        if (us.getSenha().equals(atual)){
            if (nova1.equals(nova2)){
                us.setSenha(nova1);
                tr.atualizar(us);
                %>
                <p> Senha alterada com sucesso!</p>
                <%
            } else{
                %><p>Novas senha e sua verifica��o n�o batem! Digite uma nova senha e confirme.</p><%
            }
        }else{
%><p>Senha atual incorreta! Voc� precisa digitar a senha atual para mud�-la.</p><%
        }}

        
        %>

</center>
</body>
</html>