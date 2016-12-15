
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="data.RealizaDO"%>
<%@page import="data.GEDO"%>
<%@page import="transacoes.Realiza"%>
<%@page import="transacoes.GE"%>
<%@page import="transacoes.GE"%>
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
            #CalendarioGeral td:hover {background-color: #ddd;}
            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #333333;
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
    <body>
        <div>
            <table align="center" id="CalendarioGeral">
                <tr>
                    <td width="100%" colspan="7" align = "center" bgcolor="ffffff">
                        <font size="5"><b><%=monthNames[int_selectedMonth-1]%>, <%=int_selectedYear%></b></font>
                    </td>
                </tr>
                <tr>
                    <th width="14%"><font size="4">Domingo</font></th>
                    <th width="14%"><font size="4">Segunda</font></th>
                    <th width="14%"><font size="4">Ter�a</font></th>
                    <th width="14%"><font size="4">Quarta</font></th>
                    <th width="14%"><font size="4">Quinta</font></th>
                    <th width="15%"><font size="4">Sexta</font></th>
                    <th width="15%"><font size="4">S�bado</font></th>
                </tr>
                <%
                    //LEMBRAR QUE JANEIRO � O M�S ZERO??  
                    Month aMonth;
                    aMonth = Month.getMonth(int_selectedMonth-1, int_selectedYear);
                    LocalDate local = LocalDate.now();
                    int[][] days = aMonth.getDays();
                    String str_localdate = "1900-01-01";
                    int int_localday;
                    java.sql.Date date_localdate;
                    int localday = 0;
                    int tempday = 0;
                    int tempday2 = 0;
                    int last_day_prev = 0;
                    int firstday = 1; // Primeiro dia do m�s sempre sera 1
                    int lastday = 0;
                    //NECESS�RIO?? int int_actualMonth = currentMonthInt + 1;
                    //String str_actualMonth = new Integer(int_actualMonth).toString();
                    String str_lastday = "";
                    String str_firstday = "";
                    java.sql.Date date_tempday;
                    //VARI�VEIS DE INTERPOLA��O
                    float Xmax = 0;
                    float Xmin = 0;
                    float Xmed = 0;
                    float Ymax = 0;
                    float Ymin = 0;
                    float Ymed = 0;
                   //java.time.Month mt=java.time.Month.of(int_selectedMonth);
                   //mt.m
                    //CALCULA �LTIMO DIA DO M�S -----------------
                    for (int i = 3; i < aMonth.getNumberOfWeeks(); i++) {
                        for (int j = 0; j < 7; j++) {
                            last_day_prev = lastday;
                            lastday = days[i][j];
                            if (lastday == 0) {
                                lastday = last_day_prev;
                                break;
                            }
                        }
                    }
                    //lastday=30;

                    str_firstday = str_selectedYear + "-" + str_selectedMonth + "-" + "0" + Integer.toString(firstday);
                    java.sql.Date date_FirstDay = java.sql.Date.valueOf(str_firstday);
                    str_lastday = str_selectedYear + "-" + str_selectedMonth + "-" + Integer.toString(lastday);
                    java.sql.Date date_LastDay = java.sql.Date.valueOf(str_lastday);

                    //---------------------------------------------------------
                    //BUSCA EVENTOS DO M�S ATUAL
                    Evento tre = new Evento();
                    List<EventoDO> eventos_do_Mes = new ArrayList<EventoDO>();
                    eventos_do_Mes = tre.buscarMes(date_FirstDay, date_LastDay);

                    //---------------------------------------------------------
                    //FILTRA DOS GRUPOS N�O ATIVOS
                    GE gtn = new GE();
                    Realiza rtn = new Realiza();
                    GEDO ge;
                    RealizaDO real;

                    if (eventos_do_Mes.size() > 0) {
                        int i = 0;
                        while (i < eventos_do_Mes.size()) {
                            ge = gtn.buscar(rtn.buscarPorEVE(eventos_do_Mes.get(i).getId()).getGEid());
                            if (ge.getAutorizado() == 0) {
                                eventos_do_Mes.remove(i);
                            } else {
                                i++;
                            }
                        }
                    }

                    //CONSTROI ARRAY LINEAR DE N�MERO DE EVENTOS POR DIA, PARA UM M�S                    
                    int[] eventos = new int[40]; // Come�amos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa eventos com zeros
                        eventos[k] = 0;
                    }

                    if (!eventos_do_Mes.isEmpty()) {
                        for (EventoDO evento_temp : eventos_do_Mes) {
                            date_tempday = evento_temp.getData(); // pega a data com formato Date
                            tempday2 = date_tempday.getDate(); // converte a data para Int
                            eventos[tempday2]++;
                        }
                    }

                    //INTERPOLA��O ---------------------------------------------------
                    //XM�X e XMIN (maximo e minimo numero de eventos em um mes)
                    for (int k = 0; k < 40; k++) {
                        if ((float) eventos[k] > Xmax) {
                            Xmax = (float) eventos[k];
                        }
                        Xmin = Xmax;
                        if ((float) eventos[k] < Xmin) {
                            Xmin = (float) eventos[k];
                        }
                    }

                    //Caso n�o haja eventos no m�s, colocamos (Xmax = 1) para n�o causar erros na tabela de cores
                    if (Xmax == 0) {
                        Xmax = 1;
                    }

                    Ymin = 0f; // SATURA��O M�NIMA
                    Ymax = 1.0f; // SATURA��O M�XIMA

                    float sat;
                    Color RGBColor;
                    String hexColor;

                    //---------------------------------------------------------
                    //CONSTROI ARRAY LINEAR DE CORES POR DIA, PARA UM M�S    
                    String[] cores = new String[40]; // Come�amos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa cores com vazios
                        cores[k] = "";
                    }

                    for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
                        for (int j = 0; j < 7; j++) {
                            localday = days[i][j];

                            //INTERPOLA��O POR N�MERO DE EVENTOS POR DIA --------------------------------------------
                            Xmed = (float) eventos[localday];
                            Ymed = Ymin + (Xmed - Xmin) / (Xmax - Xmin) * (Ymax - Ymin);
                            sat = Ymed;
                            RGBColor = Color.getHSBColor(0.59f, sat, 1f);
                            hexColor = "#" + Integer.toHexString(RGBColor.getRGB()).substring(2);
                            // --------------------------------------------------------------------------------------

                            //DIAS J� PASSADOS EM CINZA
                            if (int_selectedYear < int_currentYear) {
                                if (eventos[localday] == 0) {
                                    cores[localday] = "#e6e6e6";
                                } else {
                                    cores[localday] = "#bfbfbf";
                                }
                            } else if (int_selectedYear == int_currentYear) {
                                if (int_selectedMonth < int_currentMonth) {
                                    if (eventos[localday] == 0) {
                                        cores[localday] = "#e6e6e6";
                                    } else {
                                        cores[localday] = "#bfbfbf";
                                    }
                                } else if (int_selectedMonth == int_currentMonth) {
                                    if (days[i][j] < int_currentDay) {
                                        if (eventos[localday] == 0) {
                                            cores[localday] = "#e6e6e6";
                                        } else {
                                            cores[localday] = "#bfbfbf";
                                        }
                                    } else {
                                        cores[localday] = hexColor;
                                    }
                                } else {
                                    cores[localday] = hexColor;
                                }
                            } else {
                                cores[localday] = hexColor;
                            }
                        }
                    }

                for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
                %><tr><%
                    for (int j = 0; j < 7; j++) {
                        localday = days[i][j];

                        if (localday < 10 && localday != 0) {
                            str_localdate = str_selectedYear + "-" + str_selectedMonth + "-" + "0" + Integer.toString(localday);
                        } else if (localday >= 10 && localday != 0) {
                            str_localdate = str_selectedYear + "-" + str_selectedMonth + "-" + Integer.toString(localday);
                        } else {
                        }

                        if (days[i][j] == 0) {
                    %><td>&nbsp;</td><%
                    } else {
                        // Destaca o Dia de HOJE
                        if (int_currentDay == days[i][j] && int_currentMonth == int_selectedMonth && int_currentYear == int_selectedYear) {
                    %><td  align = "center" bgcolor=<%=cores[localday]%>><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>" <font size="5"><b><%=days[i][j]%></b></font></a></td><%
                    } else {
                                %><td align = "center" bgcolor=<%=cores[localday]%>><a href="/agenda/EventosdoDia.jsp?str_ClickedDate=<%=str_localdate%>"<font size="4"><%=days[i][j]%></font></a>
                    </td><%
                                }
                            }
                        }
                    %>
                </tr>
                <%}
                %>
            </table>

        </div>
        <!-- Bot�es de Navega��o -->
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
