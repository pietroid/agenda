<html>
    
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Dados </center> </h1>

<BR>
    
    
    <%    
        UsuarioDO us = new UsuarioDO();
        us = (UsuarioDO)session.getAttribute("Usuario");
        Usuario tr = new Usuario();
        
        
        if(request.getParameter("submit")==null){%>
<FORM action="AltPass.jsp" method="post" id = "changePassForm">
    <center>
Nome:<BR><INPUT type="text" name="nome" value= "<% out.write(us.getNome()); %>"> <BR>
E-mail:<BR><INPUT type="text" name="email" value= "<% out.write(us.getEmail()); %>"> <BR>
Curso:<BR><INPUT type="text" name="curso" value= "<% out.write(us.getCurso()); %>"> <BR>
<BR><BR><BR>
<p>Preencha apenas caso deseje mudar a senha.</p>
Senha Atual:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR>
Nova Senha<BR><INPUT type="password" name="novaSenha" value= ""> <BR><BR>
Repita a Nova Senha<BR><INPUT type="password" name="repNovaSenha" value= ""> <BR><BR>
    </center>
</FORM>
<INPUT type ="submit" name="submit" value= "Submit" form="changePassForm">   
<INPUT type ="reset" name="reset" value= "Reset" form = "changePassForm">
    <%
        } else if (request.getParameter("submit").equals("Submit")){
        
        

        String atual = request.getParameter("senhaAtual");
        String nova1 = request.getParameter("novaSenha");
        String nova2 = request.getParameter("repNovaSenha");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String curso = request.getParameter("curso");

        us.setNome(nome);
        us.setCurso(curso);
        us.setEmail(email);
        tr.atualizar(us);
%>
                <p> Informações básicas alteradas com sucesso!</p>
                <%
        if (atual.equals("") && nova1.equals("") && nova2.equals("")){
        //caso não queira mudar a senha

} else {

        
        if (us.getSenha().equals(atual)){
            if (nova1.equals(nova2)){
                us.setSenha(nova1);
                tr.atualizar(us);
                %>
                <p> Senha alterada com sucesso!</p>
                <%
            } else{
                %><p>Senha não alterada: Novas senha e sua verificação não batem! Digite uma nova senha e confirme.</p><%
            }
        }else{
%><p>Senha não alterada: Senha atual incorreta! Você precisa digitar a senha atual para mudá-la.</p><%
        }}}

        
        %>

</center>
</body>
</html>
