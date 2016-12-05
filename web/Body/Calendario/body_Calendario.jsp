<%@ page import="calendar.Month,java.util.*,utils.*,java.io.*,java.sql.*" errorPage="error.jsp" %>
<%@page import="java.text.*, java.lang.*"%>
<%@ include file="calendarCommon.jsp" %>

<html>
<head>
  <title>Calendario Geral</title>
    <style>
    table {
        font-family: "Verdana";
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
  //LEMBRAR QUE JANEIRO É O MÊS ZERO!!  
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
  
  int [][] days = aMonth.getDays();
  String str_localdate = "00/00/0000";
  int int_localday;
  java.util.Date date_localdate;
  
  int int_actualMonth = currentMonthInt + 1;
  String str_actualMonth = new Integer(int_actualMonth).toString();
  
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr><%
    for( int j=0; j<7; j++ )
    {
      int_localday = days[i][j];
      
      if (int_localday < 10 && int_localday !=0){
          str_localdate = str_actualMonth + "/" + "0" + Integer.toString(int_localday) + "/" + currentYearString;
      }
      
      else{
          if(int_localday!=0){
              str_localdate = str_actualMonth + "/" + Integer.toString(int_localday) + "/" + currentYearString;
          }
      }
      
      date_localdate = formatter.parse(str_localdate);
      
      %><%=date_localdate%> ---<%
      
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
        %><td align = "center">
          <a href="/Agenda/Evento.jsp" <%request.setAttribute("t","");%>>
          <font size="4"><%=days[i][j]%></font>
          </a>
        </td><%
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


