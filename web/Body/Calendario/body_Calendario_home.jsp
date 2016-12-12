
<%@page import="transacoes.Seguindo"%>
<%@page import="data.MembroDO"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.EventoDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="java.awt.Color"%>
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
  //LEMBRAR QUE JANEIRO É O MÊS ZERO!!  
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  //DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
  
  int [][] days = aMonth.getDays();
  String str_localdate = "1900-01-01";
  int int_localday;
  java.sql.Date date_localdate;
  int localday = 0;
  int tempday = 0;
  int tempday2 = 0;
  int last_day_prev = 0;
  int firstday = 1;
  int lastday = 0;
  int int_actualMonth = currentMonthInt + 1;
  int eventos_max = 0;
  String str_actualMonth = new Integer(int_actualMonth).toString();
  String str_lastday = "";
  String str_firstday = "";
  java.sql.Date date_tempday;
  float ev = 0;
  
  //CALCULA O PRIMEIRO E ÚLTIMOS DIAS DO MÊS -----------------
    for( int i=3; i<aMonth.getNumberOfWeeks()+1; i++ ){
         for( int j=0; j<7; j++ ){
             last_day_prev = tempday;
             tempday = days[i][j];
             if(lastday==0 && tempday==0){lastday = last_day_prev;}
         }
    }
  
    str_firstday = currentYearString + "-" + str_actualMonth + "-" + "0" + Integer.toString(firstday);
    java.sql.Date date_FirstDay = java.sql.Date.valueOf(str_firstday);
    str_lastday = currentYearString + "-" + str_actualMonth + "-" + Integer.toString(lastday);
    java.sql.Date date_LastDay = java.sql.Date.valueOf(str_lastday);
    
  //---------------------------------------------------------
  
  //BUSCA EVENTOS DO MÊS ATUAL
  
    Evento tre = new Evento();
    List<EventoDO> eventos_do_Mes=new ArrayList<EventoDO>();
    eventos_do_Mes = tre.buscarMes(date_FirstDay, date_LastDay);
    
  //---------------------------------------------------------
  
  //DETERMINA TIPO DE USUÁRIO------------------------------
    int [] eventos_seguidos = new int[40]; // Começamos a usar a partir do Dia 1     
    UsuarioDO usr= (UsuarioDO)session.getAttribute("Usuario");
    boolean registered_usr = false;
    boolean admin_usr = false;
    boolean super_usr = false;
    int usrID = usr.getId();
    int eventoID;
    Membro tr = new Membro();
    Seguindo sg = new Seguindo();
   
    if(usr!=null){
        registered_usr = true;
        
        List<MembroDO> lm = tr.AdminedGroups(usrID);        
        if(!lm.isEmpty()){
            admin_usr = true;
        }    
    }
    
    //USUÁRIO COMUM
    if(registered_usr && !admin_usr){
  
    //CONSTROI TABELA DE EVENTOS SEGUIDOS

   
    for(int k=0; k<40; k++){ // Inicializa eventos com zeros
        eventos_seguidos[k] = 0;
    }

    if(!eventos_do_Mes.isEmpty()){
        for (EventoDO evento_temp : eventos_do_Mes) {
            eventoID = evento_temp.getId(); 
            date_tempday = evento_temp.getData();
            tempday2 = date_tempday.getDate();
            eventos_seguidos[tempday2]++;
        }  
    }
  
    for(int k=0; k<40; k++){ // Printa eventos[k]
        if(eventos_seguidos[k]>eventos_max){
            eventos_max = eventos_seguidos[k];
        }
    }
    }
    if(eventos_max == 0){
        eventos_max = 1;
    }
    float br;
    Color RGBColor;
    String hexColor, hexBranco;
  
  for(int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr><%
    for( int j=0; j<7; j++ )
    {
      localday = days[i][j];
      
      if (localday < 10 && localday !=0){
          str_localdate = currentYearString + "-" + str_actualMonth + "-" + "0" + Integer.toString(localday) ;
      } else if(localday!=0){
              str_localdate = currentYearString + "-" + str_actualMonth + "-" + Integer.toString(localday);
          }            
      %><%
      if( days[i][j] == 0 )
      {
        %><td>&nbsp;</td><%
      }
      else
      { 
        ev = (float)(eventos_seguidos[localday]);
        br = 1/((float)(100/eventos_max)*ev);//100 aqui é o espectro!
        RGBColor = Color.getHSBColor(0.12f, 0.57f, br);

        hexColor = "#"+Integer.toHexString(RGBColor.getRGB()).substring(2);  
        hexBranco = "#ffffff";
        
        // Destaca o Dia de HOJE
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
            %><td  align = "center" bgcolor=<%=hexColor%> ><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>" <font size="5"><b><%=days[i][j]%></b></font></a></td><%
        }
        else if ( currentDayInt > days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
            if(hexColor.equals(hexBranco)){
                %><td align = "center" bgcolor="#e6e6e6"> <a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a></td><%
            }
            else{
                %><td align = "center" bgcolor="#bfbfbf"><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a></td><%
            }
        }
        else if (currentMonthInt > aMonth.getMonth() && currentYearInt == aMonth.getYear() || currentYearInt > aMonth.getYear())
        {
            if(hexColor.equals(hexBranco)){
                %><td align = "center" bgcolor="#e6e6e6"><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a></td><%
            }
            else{
                %><td align = "center" bgcolor="#bfbfbf"><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a></td><%
            }
        }
        else
        {
            %><td align = "center" bgcolor=<%=hexColor%>><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a></td><%
        }
      }
    }
    %>
    </tr>
  <%}
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