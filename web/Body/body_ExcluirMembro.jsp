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
            session.setAttribute("Usuario", null);
            %>
<FORM action="ExcluirMembro.jsp" method="post" id = "deleteForm">
Digite sua senha:<BR><INPUT type="password" name="senhaAtual" value= ""> <BR><BR><BR>
</FORM>
<INPUT type ="submit" name="submit" value= "Submit" form="deleteForm">   
<INPUT type ="reset" name="reset" value= "Reset" form = "deleteForm">
<INPUT type="hidden" name="USUid" value="<%=us.getId()%>">
<INPUT type="hidden" name="senha_or" value="<%=us.getSenha()%>">
    <%
        } else if (request.getParameter("submit").equals("Submit")){
        
        String atual = request.getParameter("senhaAtual");
        int id = Integer.parseInt(request.getParameter("USUid"));
        String senha_or = request.getParameter("senha_or");
        UsuarioDO us2=new UsuarioDO();
        us2.setId(id);
        if (senha_or.equals(atual)){
            if(tr.excluir(us2)){
            
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