<%-- 
    Document   : body_ListaPOI
    Created on : 05/12/2016, 16:36:27
    Author     : Lucas Freitas
--%>

<%@page import="java.util.List"%>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center>Pontos de Interesse <center></h1>



<center>
<table align="center" border=1 cellpadding=10 width=1000>
    <th>Nome <th>Descrição
<%   
   
   PontoDeInteresse tr= new PontoDeInteresse();
   List<PontoDeInteresseDO> Lista = tr.ListarPOI();
    
   for(PontoDeInteresseDO ponto: Lista){
       String nome = ponto.getNome();
       String descricao = ponto.getDescrição();
       int id   = ponto.getId();
 %>    
<tr>
            <td><center><a href="../Body/body_AlterarPOI.jsp" <% request.setAttribute("PontoDeInteresseDO", id); %>><%=nome%></a><center>
            <td><center><a href="../Body/body_AlterarPOI.jsp" <% request.setAttribute("PontoDeInteresseDO", id); %>><%=descricao%></a><center>
</tr>

<%
   }
%>


</table>
<center>
    <BR>
    <BR>
    Deseja cadastrar um novo ponto de interesse? 
    <BR> <BR>
    
    
<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
        
        %>
        <FORM action="body_Cadastro_POI.jsp" method="post">
        <INPUT type="submit" name="submit3" value="Cadastrar">    

<%    
   }else{ //HOME DESLOGADO

 %>
 <BR>
        Você precisar Logar antes
        <FORM action="body_LoginOut.jsp" method="post">
        <INPUT type="submit" name="submit2" value="Logar">    
 
 
 
<%    
   }
%>
    
    
</body>
</html>
