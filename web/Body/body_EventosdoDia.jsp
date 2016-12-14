<%-- 
    Document   : EventosdoDia
    Created on : Dec 5, 2016, 1:53:29 AM
    Author     : RFRejtman
--%>

<%@page import="data.RealizaDO"%>
<%@page import="transacoes.Realiza"%>
<%@page import="data.GEDO"%>
<%@page import="transacoes.GE"%>
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
    
Evento tre = new Evento();

List<EventoDO> eventos_do_Dia=new ArrayList<EventoDO>();
eventos_do_Dia = tre.buscarData(date_ClickedDate);
GE gtn=new GE();
Realiza rtn=new Realiza();
GEDO ge;
RealizaDO real;

if(eventos_do_Dia.size()>0){
    for(int i=0;i< eventos_do_Dia.size();i++){
        ge=gtn.buscar(rtn.buscarPorEVE(eventos_do_Dia.get(i).getId()).getGEid());
        if(ge.getAutorizado()==0){
            eventos_do_Dia.remove(i);
        }
    }
}

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
for (EventoDO evento_temp : eventos_do_Dia) { 
    if(evento_temp.isAtivo()){%>
    <tr>
        <td align="center"><a href="Evento.jsp?evento=<%= evento_temp.getId() %>"><%= evento_temp.getNome() %></a></td>
        <td align="center"><%=evento_temp.getTipo()%></td>
        <td align="center"><%=evento_temp.getHoraInicial()%></td>
        <td align="center"><%=evento_temp.getHoraFinal()%></td>
        <td align="center"><%=evento_temp.getData()%></td>
        <td align="center"><%=evento_temp.getAvaliação()%></td>
    </tr>    
    <%}else{%>
     <tr>
        <td align="center"><a style="color:red" href="Evento.jsp?evento=<%= evento_temp.getId() %>"><%= evento_temp.getNome() %>(CANCELADO)</a></td>
        <td align="center"><%=evento_temp.getTipo()%></td>
        <td align="center"><%=evento_temp.getHoraInicial()%></td>
        <td align="center"><%=evento_temp.getHoraFinal()%></td>
        <td align="center"><%=evento_temp.getData()%></td>
        <td align="center"><%=evento_temp.getAvaliação()%></td>
    </tr>       
    <%}
}
}%>
</table>
    <br><br>
</body>
</html>