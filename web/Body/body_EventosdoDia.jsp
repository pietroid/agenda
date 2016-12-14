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
    <body>

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


<% String str_ClickedDate =request.getParameter("str_ClickedDate");

java.sql.Date date_ClickedDate = java.sql.Date.valueOf(str_ClickedDate);

String str_NiceDate = String.valueOf(date_ClickedDate.getDate()) + "/" + String.valueOf(date_ClickedDate.getMonth()+1) + "/" + String.valueOf(date_ClickedDate.getYear()+1900);

%><center><font size="5"><b><br>Eventos em <%=str_NiceDate%><br></b></font></center><%
    
Evento tre = new Evento();
List<EventoDO> eventos_do_Dia=new ArrayList<EventoDO>();
eventos_do_Dia = tre.buscarData(date_ClickedDate);
if(eventos_do_Dia.isEmpty()){
    %><center><font size="5"><b><br><br><br>Ainda não há eventos cadastrados nesse dia :(<br><br><br></b></font></center><%
}
else{
%>
    <br><br>
    <table align="center">
  <tr>
      <th>Nome</th>
      <th>Tipo</th>
      <th>Hora Inicial</th>
      <th>Hora Final</th>
      <th>Data</th>
      <th>Avaliação</th>
  </tr>    
    <%
for (EventoDO evento_temp : eventos_do_Dia) { %>
    <tr>
        <td align="center"><a href="Evento.jsp?evento=<%= evento_temp.getId() %>"><%= evento_temp.getNome() %></a></td>
        <td align="center"><%=evento_temp.getTipo()%></td>
        <td align="center"><%=evento_temp.getHoraInicial()%></td>
        <td align="center"><%=evento_temp.getHoraFinal()%></td>
        <td align="center"><%=evento_temp.getData()%></td>
        <td align="center"><%=evento_temp.getAvaliação()%></td>
    </tr>    
    <%}
}%>
</table>
    <br><br>
</body>
</html>