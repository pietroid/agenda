<%-- 
    Document   : body_ListaPOI
    Created on : 05/12/2016, 16:36:27
    Author     : Lucas Freitas
--%>

<%@page import="java.util.List"%>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>
<%@page import="java.lang.Integer"%>

<%
    PontoDeInteresse getn = new PontoDeInteresse();
%>
<html>
      <head>
        <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 50%;
    }
    td, th {
        height: 50px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }
    tr:nth-child(even){background-color: #f2f2f2;}
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    </style>
    </head>    

<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center>Pontos de Interesse <center></h1>

<center>
<table align="center" border=1 cellpadding=10 width=1000>
    <th>Nome </th>
    <th>Descrição </th>
<%   
    PontoDeInteresse tr= new PontoDeInteresse();
    List<PontoDeInteresseDO> Lista = getn.ListarPOI();
    for(int i = 0; i < Lista.size(); i++){
        PontoDeInteresseDO li = Lista.get(i);
    
 %>    
<tr>          
    <td><center><a href="AlterarPOI.jsp?PontoDeInteresse=<%= li.getId()%>"><%= li.getNome() %></a></center>
    <td><center><%= li.getDescricao() %></center>
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
        <FORM action="Cadastro_POI.jsp" method="post">
        <INPUT type="submit" name="submit3" value="Cadastrar"> 
        </form>

<%    
   }else{ //HOME DESLOGADO

 %>
 <BR>
        Você precisar Logar antes
        <FORM action="LoginOut.jsp" method="post">
        <INPUT type="submit" name="submit2" value="Logar">  
        </form>
 
 
 
<%    
   }
%>
    
</center>
</body>
</html>
