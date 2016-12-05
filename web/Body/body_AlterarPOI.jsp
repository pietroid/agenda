<%-- 
    Document   : body_AlterarPOI
    Created on : 05/12/2016, 13:58:19
    Author     : Lucas Freitas
--%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informações do Ponto de Interesse <center> </h1>
<BR>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>
<%@ page import="java.util.Vector" %>


<center>
<% 
    PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
    PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
    if (request.getParameter("submit")== null) {%>
<FORM action="AlterarPOI.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="" ><BR><BR>
Descrição:<BR><INPUT type="text" maxlength="140" name="descrição" value= ""> <BR><BR>
Endereço:<BR><INPUT type="text" name="endereço" value= ""><BR><BR>
Link Para Google Maps:<BR><INPUT type="text" name="link_para_maps" value= ""><BR><BR>
Pasta De Imagens:<BR><INPUT type="text" name="pasta_de_imagens" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<%} else if(request.getParameter("submit")=="Salvar Mudanças" ) { 
 
if (request.getParameter("nome")!= null) PontoDeInteresse.setNome(request.getParameter("nome"));
if (request.getParameter("descrição")!= null) PontoDeInteresse.setDescrição(request.getParameter("descrição"));
if (request.getParameter("endereço")!= null) PontoDeInteresse.setEndereço(request.getParameter("endereço"));
if (request.getParameter("link_para_maps")!= null) PontoDeInteresse.setLink_para_maps(request.getParameter("link_para_maps"));
if (request.getParameter("pasta_de_imagens")!= null) PontoDeInteresse.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));

}

boolean update = PontoDeInteressetr.atualizar(PontoDeInteresse);

 %>
</center>
</body>
</html>