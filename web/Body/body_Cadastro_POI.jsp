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
<center></center>
<%PontoDeInteresseDO p1=new PontoDeInteresseDO();
            
      if(request.getParameter("submit")==null){%>
<FORM action="Cadastro_POI.jsp" method="post">
    
    Nome do ponto de interesse:<BR>
    <INPUT type="text" name="nome"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="descricao"><BR><BR>
    Endereço:<BR>
    <INPUT type="text" name="endereco"><BR><BR>
    Link para Google Maps:<BR>
    <INPUT type="text" name="link_para_maps"><BR><BR>
    Pasta de Imagens:<BR>
    <INPUT type="text" name="pasta_de_imagens"><BR><BR>
    
    <INPUT type="submit" name="submit" value="Submit">
      
</FORM>      
    <% }else
if (request.getParameter("submit")!=null){
    PontoDeInteresseDO ponto = new PontoDeInteresseDO();
    ponto.setNome(request.getParameter("nome"));
    ponto.setDescricao(request.getParameter("descricao"));
    ponto.setEndereco(request.getParameter("endereco"));
    ponto.setLink_para_maps(request.getParameter("link_para_maps"));
    ponto.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));
    PontoDeInteresse novo=new PontoDeInteresse();
    novo.incluir(ponto);
}
%>

  
  

</body>
</html>