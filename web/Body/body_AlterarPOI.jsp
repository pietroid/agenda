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


<center>
<% 
    PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
    PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
    if (request.getParameter("submit")== null) {%>
<FORM action="AlterarPOI.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="" ><BR><BR>
Descri��o:<BR><INPUT type="text" maxlength="140" name="descri��o" value= ""> <BR><BR>
Endere�o:<BR><INPUT type="text" name="endere�o" value= ""><BR><BR>
Link Para Google Maps:<BR><INPUT type="text" name="link_para_maps" value= ""><BR><BR>
Pasta De Imagens:<BR><INPUT type="text" name="pasta_de_imagens" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudan�as">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
<%} else if(request.getParameter("submit")=="Salvar Mudan�as" ) { 
 
if (request.getParameter("nome")!= null) PontoDeInteresse.setNome(request.getParameter("nome"));
if (request.getParameter("descri��o")!= null) PontoDeInteresse.setDescri��o(request.getParameter("descri��o"));
if (request.getParameter("endere�o")!= null) PontoDeInteresse.setEndere�o(request.getParameter("endere�o"));
if (request.getParameter("link_para_maps")!= null) PontoDeInteresse.setLink_para_maps(request.getParameter("link_para_maps"));
if (request.getParameter("pasta_de_imagens")!= null) PontoDeInteresse.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));

}

boolean update = PontoDeInteressetr.atualizar(PontoDeInteresse);

 %>
</center>
</body>
</html>