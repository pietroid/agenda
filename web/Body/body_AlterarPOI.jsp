<%-- 
    Document   : body_AlterarPOI
    Created on : 05/12/2016, 13:58:19
    Author     : Lucas Freitas
--%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informa��es do Ponto de Interesse <center> </h1>
<BR>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.lang.Integer"%>



<center>
<% 
    if(request.getParameter("PontoDeInteresse") != null){
        
        PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
        PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
        PontoDeInteresse = PontoDeInteressetr.buscar(Integer.parseInt(request.getParameter("PontoDeInteresse")));
        if(request.getParameter("submit")==null){
         %>
<FORM action="AlterarPOI.jsp" method="post">
    Nome do ponto de interesse:<BR>
    <INPUT type="text" name="nome" value="<%=PontoDeInteresse.getNome()%>"><BR><BR>
    Descri��o:<BR>
    <INPUT type="text" name="descricao" value="<%=PontoDeInteresse.getDescricao()%>"><BR><BR>
    Endere�o:<BR>
    <INPUT type="text" name="endereco" value="<%=PontoDeInteresse.getEndereco()%>"><BR><BR>
    Link para Google Maps:<BR>
    <INPUT type="text" name="link_para_maps" value="<%=PontoDeInteresse.getLink_para_maps()%>"><BR><BR>
    Pasta de Imagens:<BR>
    <INPUT type="text" name="pasta_de_imagens" value="<%=PontoDeInteresse.getPasta_de_imagens()%>"><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudancas">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<%} else
    
    
    if(request.getParameter("submit").equals("Salvar Mudancas") ) { 
 
if (request.getParameter("nome")!= null) PontoDeInteresse.setNome(request.getParameter("nome"));
if (request.getParameter("descricao")!= null) PontoDeInteresse.setDescricao(request.getParameter("descricao"));
if (request.getParameter("endereco")!= null) PontoDeInteresse.setEndereco(request.getParameter("endereco"));
if (request.getParameter("link_para_maps")!= null) PontoDeInteresse.setLink_para_maps(request.getParameter("link_para_maps"));
if (request.getParameter("pasta_de_imagens")!= null) PontoDeInteresse.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));

}
PontoDeInteressetr.atualizar(PontoDeInteresse);

}else {pageContext.forward("ListaPOI.jsp");}     
    
%>


</center>
</body>
</html>
