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
        
         %>
<FORM action="AlterarPOI.jsp" method="post">
    Nome do ponto de interesse:<BR>
    <INPUT type="text" name="nome" value="<%=PontoDeInteresse.getNome()%>"><BR><BR>
    Descri��o:<BR>
    <INPUT type="text" name="descri��o" value="<%=PontoDeInteresse.getDescricao()%>"><BR><BR>
    Endere�o:<BR>
    <INPUT type="text" name="endere�o" value="<%=PontoDeInteresse.getEndereco()%>"><BR><BR>
    Link para Google Maps:<BR>
    <INPUT type="text" name="link_para_maps" value="<%=PontoDeInteresse.getLink_para_maps()%>"><BR><BR>
    Pasta de Imagens:<BR>
    <INPUT type="text" name="pasta_de_imagens" value="<%=PontoDeInteresse.getPasta_de_imagens()%>"><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudan�as">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<%
    
    
    if(request.getParameter("submit")=="Salvar Mudan�as" ) { 
 
if (request.getParameter("nome")!= null) PontoDeInteresse.setNome(request.getParameter("nome"));
if (request.getParameter("descri��o")!= null) PontoDeInteresse.setDescricao(request.getParameter("descri��o"));
if (request.getParameter("endere�o")!= null) PontoDeInteresse.setEndereco(request.getParameter("endere�o"));
if (request.getParameter("link_para_maps")!= null) PontoDeInteresse.setLink_para_maps(request.getParameter("link_para_maps"));
if (request.getParameter("pasta_de_imagens")!= null) PontoDeInteresse.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));

}

boolean update = PontoDeInteressetr.atualizar(PontoDeInteresse);

 %>
 <% }else {pageContext.forward("ListaPOI.jsp");}     
    
%>


</center>
</body>
</html>
