<html>
    
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>

   <center> <h1> <font face="verdana"> Excluir sua Conta </font> </h1></center>
<BR>
    
    
    <%    
        UsuarioDO us = (UsuarioDO)session.getAttribute("Usuario");
        Usuario tr = new Usuario();
        
        
        if(request.getParameter("submit")==null){
            
            %>
<FORM action="ExcluirMembro.jsp" method="post" id = "deleteForm">
Digite sua senha:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>

<INPUT type ="submit" name="submit" value= "Submit">   
<INPUT type ="reset" name="reset" value= "Reset">
</FORM>
    <%
        } else if (request.getParameter("submit").equals("Submit")){
        
        String atual = request.getParameter("senhaAtual");
        
        if (us.getSenha().equals(atual)){
            if(tr.excluir(us)){
                session.setAttribute("Usuario", null);
    %><center><p>Sua conta foi removida.</p></center><%
            }else{
%><center><p>Você é o único administrador do seu grupo de extensão. Apague primeiro seu grupo</p></center><%
            }
        }else{
%><center><p>Senha atual incorreta! Você precisa digitar a senha atual para excluir sua conta.</p></center><%
        }}
        
        %>

</body>
</html>