<%@page import="data.GEDO"%>
<html>
<body BGCOLOR =#EAD1A4>
<h1><center>Cadastro Grupo de Extens�o<center></h1>
<BR>

  
    Nome grupo:<BR>
    <INPUT type="text" name="nome"><BR><BR>
    Tipo/finalidade:<BR>
    <INPUT type="text" name="tipo"><BR><BR>
    Site do grupo:<BR>
    <INPUT type="text" name="site"><BR><BR>
    Ano de cria��o:<BR>
    <INPUT type="text" name="ano"><BR><BR>
    e-mail para contato (do grupo):<BR>
    <INPUT type="text" name="email"><BR><BR>
    Telefone para contato (do grupo):<BR>
    <INPUT type="text" name="tel"><BR><BR>
    Facebook do grupo:<BR>
    <INPUT type="text" name="email"><BR><BR>
    Descri��o:<BR>
    <INPUT type="text" name="descricao"><BR><BR>
    Local do grupo (dentro da POLI)<BR>
    <INPUT type="text" name="local"><BR><BR>
    
    Foto?!?!?!?<BR><BR>
    
    
    <INPUT type="submit" name="submit" value="Submit">
    
    <% 
if (request.getParameter("submit") != null){
    GEDO grupo = new GEDO();
    grupo.setNome(request.getParameter("nome"));
    grupo.setTipo(request.getParameter("tipo"));
    grupo.setSite(request.getParameter("site"));
    grupo.setEmail(request.getParameter("email"));
    grupo.setTel(tel);
    grupo.setLocal(request.getParameter("local"));
    grupo.setDescricao(request.getParameter("descricao"));
    grupo.setAno(request.getParameter("ano"));
    boolean valido = tru.verificar(grupo);
    if (valido){
        session.setAttribute("USnome", usuario.getNome());  //Decidir com os demais   
        pageContext.forward("body_Perfil.jsp");
    }
    else
    {
        %>
        
        
        "Este grupo j� existe!"
        <%
}
%>
    
    
    
    
    
    
    <INPUT type="reset" name="reset" value="Reset">
  
<BR><BR><a href="../EsqueceuSenha.jsp" target=" _top">Esqueceu sua senha?</a>

</body>
</html>
