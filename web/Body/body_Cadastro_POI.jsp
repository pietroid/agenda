<%-- 
    Document   : Cadastro_POI
    Created on : 05/12/2016, 12:37:02
    Author     : Lucas Freitas
--%>


<%@page import="java.lang.Integer"%>
<%@page import="transacoes.PontoDeInteresse"%>
<%@page import="data.PontoDeInteresseDO"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Cadastro Ponto de Interesse<center></h1>
<BR>
<FORM action="Cadastro_POI.jsp" method="post">
    
    Nome do ponto de interesse:<BR>
    <INPUT type="text" name="nome"><BR><BR>
    Descri��o:<BR>
    <INPUT type="text" name="descri��o"><BR><BR>
    Endere�o:<BR>
    <INPUT type="text" name="endere�o"><BR><BR>
    Link para Google Maps:<BR>
    <INPUT type="text" name="link_para_maps"><BR><BR>
    Pasta de Imagens:<BR>
    <INPUT type="text" name="pasta_de_imagens"><BR><BR>
    
    
    
    
    <INPUT type="submit" name="submit" value="Submit">
    
    <% 
if (request.getParameter("submit") != null){
    PontoDeInteresseDO ponto = new PontoDeInteresseDO();
    ponto.setNome(request.getParameter("nome"));
    ponto.setDescri��o(request.getParameter("descri��o"));
    ponto.setEndere�o(request.getParameter("endere�o"));
    ponto.setLink_para_maps(request.getParameter("link_para_maps"));
    ponto.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));
    PontoDeInteresse novo=new PontoDeInteresse();
    novo.incluir(ponto);
}
%>
    
</FORM>    
    
    
    
    
    <INPUT type="reset" name="reset" value="Reset">
  

</body>
</html>