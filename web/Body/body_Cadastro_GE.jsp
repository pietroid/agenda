<%@page import="data.GEData"%>
<%@page import="java.lang.Integer"%>
<%@page import="transacoes.GE"%>
<%@page import="data.GEDO"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Cadastro Grupo de Extensão<center></h1>
<BR>


    <% 
if (request.getParameter("submit") == null){
    %>
<FORM action="Cadastro_GE.jsp" method="post">
    
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
    <INPUT type="submit" name="submit" value="Submit">
    <INPUT type="reset" name="reset" value="Reset">



    <% }%>
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
    try{
        grupo.setAno(Integer.parseInt(request.getParameter("ano"))); %>
            Cadastro efetuado com sucesso!  <BR>
    Espere a confirmação de um de nossos administradores.
        <%
           GE novo = new GE();
           novo.incluir(grupo);
        
    }catch(Exception e){
    %>
        É necessário digitar um número para o ano <BR> 
        
    <FORM action="Cadastro_GE.jsp" method="post">           
    Nome grupo:<BR>
    <INPUT type="text" name="nome" value="<%=request.getParameter("nome")%>"><BR><BR>
    Tipo/finalidade:<BR>
    <INPUT type="text" name="tipo" value="<%=request.getParameter("tipo")%>"><BR><BR>
    Site do grupo:<BR>
    <INPUT type="text" name="site" value="<%=request.getParameter("site")%>"><BR><BR>
    Ano de criação:<BR>
    <INPUT type="text" name="ano"><BR><BR>
    e-mail para contato (do grupo):<BR>
    <INPUT type="text" name="email" value="<%=request.getParameter("email")%>"><BR><BR>
    Telefone para contato (do grupo):<BR>
    <INPUT type="text" name="tel" value="<%=request.getParameter("tel")%>"><BR><BR>
    Facebook do grupo:<BR>
    <INPUT type="text" name="email" value="<%=request.getParameter("email")%>"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="descricao" value="<%=request.getParameter("descricao")%>"><BR><BR>
    Local do grupo (dentro da POLI)<BR>
    <INPUT type="text" name="local"><BR><BR>
    <INPUT type="submit" name="submit" value="Submit">
    <INPUT type="reset" name="reset" value="Reset">
    </FORM>  
 <% }} %>
  
    
 
</body>
</html>
