<%-- 
    Document   : EventosdoDia
    Created on : Dec 5, 2016, 1:53:29 AM
    Author     : RFRejtman
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>George</title>
    <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 90%;
    }

    td, th {
        height: 70px;
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
<iframe src="Título\título.jpg" width="1350" height="150" frameBorder="0" scrolling="no"></iframe>
<%@include  file="Menu/menu.jsp"%>
<br>

<table align="center">
  <tr>
      <th>Nome</th>
      <th>Descrição</th>
      <th>Tipo</th>
      <th>Macro Evento</th>
      <th>Hora Inicial</th>
      <th>Hora Final</th>
      <th>Data</th>
      <th>Avaliação</th>
  </tr>    

<% String str_ClickedDate =request.getParameter("str_ClickedDate");

%><%= str_ClickedDate %>---<%

java.sql.Date date_ClickedDate = java.sql.Date.valueOf(str_ClickedDate);
      

Evento tre = new Evento();
List<EventoDO> eventos_do_Dia=new ArrayList<EventoDO>();
eventos_do_Dia = tre.buscarData(date_ClickedDate);
for (EventoDO evento_temp : eventos_do_Dia) { %>
<tr>
    <td align="center"><%=evento_temp.getNome()%></td>
    <td align="center"><%=evento_temp.getDescricao()%></td>
    <td align="center"><%=evento_temp.getTipo()%></td>
    <td align="center"><%=evento_temp.getMacroEvento()%></td>
    <td align="center"><%=evento_temp.getHoraInicial()%></td>
    <td align="center"><%=evento_temp.getHoraFinal()%></td>
    <td align="center"><%=evento_temp.getData()%></td>
    <td align="center"><%=evento_temp.getAvaliação()%></td>
</tr>    
<%}%>
</table>

<iframe src="Footer\footer.jsp" width="1350" height="200" frameBorder="0" scrolling="no">    
</html>