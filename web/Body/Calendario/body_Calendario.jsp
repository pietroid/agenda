<%@ page import="calendar.Month,java.util.*,utils.*,java.io.*,java.sql.*" errorPage="error.jsp" %>
<%@ include file="calendarCommon.jsp" %>

<html>
<head>
  <title>Calendario Geral</title>
    <style>
    table {
        font-family: "Arial" sans-serif;
        border-collapse: collapse;
        width: 70%;
    }

    td, th {
        height: 70px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }

    tr:nth-child(even){background-color: #f2f2f2;}

    #CalendarioGeral td:hover {background-color: #ddd;}

    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    #B_navegacao {
        border: 0px;
    }
    
    #B_navegacao td, th {
        border: 0px;
        height: 50px;
    }
    
    </style>
</head>

<!-- REMOVER IDS! -->
<!-- TAGS ALIGN E FONT NÃO COMPATÍVEIS COM HTML5 -->
<!-- REMOVER PAGE IMPORT? -->

<body>

 <% int largura=60;%> <!-- SÓ USAR DE 50% PRA CIMA! -->
    
<div>
<table align="center" id="CalendarioGeral">
  <tr>
    <td width="100%" colspan="7" align = "center">
      <font size="5">
      <%=monthName%>, <%=intYear%>
      </font>
    </td>
  </tr>
  <tr>
      <th width="14%"><font size="4">Domingo</font></th>
      <th width="14%"><font size="4">Segunda</font></th>
      <th width="14%"><font size="4">Terça</font></th>
      <th width="14%"><font size="4">Quarta</font></th>
      <th width="14%"><font size="4">Quinta</font></th>
      <th width="15%"><font size="4">Sexta</font></th>
      <th width="15%"><font size="4">Sábado</font></th>
  </tr>
<%
{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr><%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        %><td>&nbsp;</td><%
      }
      else
      {
        // Destaca o Dia de HOJE
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
        %><td align = "center"><a href="/Agenda/Evento.jsp"><font size="5"><b><%=days[i][j]%></b></font></a></td><%
        }
        else
        {
        %><td align = "center"><a href="/Agenda/Evento.jsp"><font size="4"><%=days[i][j]%></font></a></td><%
        }
      }
    }
    %>
    </tr>
  <%}
}
%>
</table>

</div>

<!-- Botões de Navegação -->
<table  align="center" border="0" id="B_navegacao">
  <tr>
    <td width="50%">
      <form method="post">
        <input type="submit" name="PREV" value="  <<  ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    
    <td width="50%" align="right">
      <form method="post">
        <input type="submit" name="NEXT" value="  >>  ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>

</body>
</html>


