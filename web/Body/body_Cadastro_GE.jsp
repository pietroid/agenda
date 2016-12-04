<%@page import="java.lang.Integer"%>
<%@page import="transacoes.GE"%>
<%@page import="data.GEDO"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Cadastro Grupo de Extensão<center></h1>
<BR>
<FORM action="body_LoginOut.jsp" method="post">
  
    Nome grupo:<BR>
    <INPUT type="text" name="nome"><BR><BR>
    Tipo/finalidade:<BR>
    <INPUT type="text" name="tipo"><BR><BR>
    Site do grupo:<BR>
    <INPUT type="text" name="site"><BR><BR>
    Ano de criação:<BR>
    <INPUT type="text" name="ano"><BR><BR>
    e-mail para contato (do grupo):<BR>
    <INPUT type="text" name="email"><BR><BR>
    Telefone para contato (do grupo):<BR>
    <INPUT type="text" name="tel"><BR><BR>
    Facebook do grupo:<BR>
    <INPUT type="text" name="email"><BR><BR>
    Descrição:<BR>
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
    grupo.setTel(request.getParameter("tel"));
    grupo.setLocal(request.getParameter("local"));
    grupo.setDescricao(request.getParameter("descricao"));
    grupo.setAno(Integer.parseInt(request.getParameter("ano")));
    GE novo=new GE();
    novo.incluir(grupo);
}
%>
    
</FORM>    
    
    
    
    
    <INPUT type="reset" name="reset" value="Reset">
  

</body>
</html>
