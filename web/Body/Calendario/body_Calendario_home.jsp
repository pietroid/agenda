
<%@page import="data.SeguindoDO"%>
<%@page import="transacoes.Seguindo"%>
<%@page import="data.MembroDO"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.UsuarioDO"%>
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
                    <th width="14%"><font size="4">Terça</font></th>
                    <th width="14%"><font size="4">Quarta</font></th>
                    <th width="14%"><font size="4">Quinta</font></th>
                    <th width="15%"><font size="4">Sexta</font></th>
                    <th width="15%"><font size="4">Sábado</font></th>
                </tr>
                <%
                    //LEMBRAR QUE JANEIRO É O MÊS ZERO??  
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
                    int firstday = 1; // Primeiro dia do mês sempre sera 1
                    int lastday = 0;
                    //NECESSÁRIO?? int int_actualMonth = currentMonthInt + 1;
                    //String str_actualMonth = new Integer(int_actualMonth).toString();
                    String str_lastday = "";
                    String str_firstday = "";
                    java.sql.Date date_tempday;
                    //VARIÁVEIS DE INTERPOLAÇÃO
                    float Xmax = 0;
                    float Xmin = 0;
                    float Xmed = 0;
                    float Ymax = 0;
                    float Ymin = 0;
                    float Ymed = 0;
                    
                    //DETERMINA O TIPO DE USUÁRIO ----------------------------------
                    boolean admin2 = false;
                    UsuarioDO usr2 = (UsuarioDO) session.getAttribute("Usuario");
                    int usrID = usr2.getId();

                    if (usr2 != null) {

                        Membro tr = new Membro();

                        //Relacoes de Membro para os quais o usuario é ADM 
                        List<MembroDO> lm = tr.AdminedGroups(usrID);

                        if (!lm.isEmpty()) {
                            admin2 = true;
                        }
                    }                    
                   
                    //CALCULA ÚLTIMO DIA DO MÊS ----------------------------------
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
                    //BUSCA EVENTOS DO MÊS ATUAL
                    Evento tre = new Evento();
                    List<EventoDO> eventos_do_Mes = new ArrayList<EventoDO>();
                    eventos_do_Mes = tre.buscarMes(date_FirstDay, date_LastDay);

                    //---------------------------------------------------------
                    //FILTRA DOS GRUPOS NÃO ATIVOS
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
                    
                    //CONSTROI ARRAY LINEAR DE NÚMERO DE EVENTOS SEGUIDOS POR DIA, PARA UM MÊS                   
                    int[] eventos_seguidos = new int[40]; // Começamos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa eventos com zeros
                        eventos_seguidos[k] = 0;
                    }                      
                                    
                    
                    //CONSTROI ARRAY LINEAR DE CORES POR DIA, PARA UM MÊS    
                    String[] cores = new String[40]; // Começamos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa cores com vazios
                        cores[k] = "";
                    }                    
                    

                    //PARA USUÁRIO COMUM -------------------------------------------------------------------- 
                    Seguindo trs = new Seguindo();
                    int eveID;
                                   
                    if (!admin2) {                          
                        
                        if (!eventos_do_Mes.isEmpty()) {
                            for (EventoDO evento_temp : eventos_do_Mes) {
                                eveID = evento_temp.getId(); // Pega o ID do evento da iteracao
                                if (trs.isSeguindo(usrID, eveID)) { //Se o usuário seguir o evento
                                    date_tempday = evento_temp.getData(); // pega a data com formato Date
                                    tempday2 = date_tempday.getDate(); // converte a data para Int
                                    eventos_seguidos[tempday2]++;
                                }
                            }
                        }
                        
                    //INTERPOLAÇÃO ---------------------------------------------------
                    //XMÁX e XMIN (maximo e minimo numero de eventos em um mes)
                    for (int k = 0; k < 40; k++) {
                        if ((float) eventos_seguidos[k] > Xmax) {
                            Xmax = (float) eventos_seguidos[k];
                        }
                        Xmin = Xmax;
                        if ((float) eventos_seguidos[k] < Xmin) {
                            Xmin = (float) eventos_seguidos[k];
                        }
                    }

                    //Caso não haja eventos no mês, colocamos (Xmax = 1) para não causar erros na tabela de cores
                    if (Xmax == 0) {
                        Xmax = 1;
                    }

                    Ymin = 0f; // SATURAÇÃO MÍNIMA
                    Ymax = 1.0f; // SATURAÇÃO MÁXIMA

                    float sat;
                    Color RGBColor;
                    String hexColor;

                    for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
                        for (int j = 0; j < 7; j++) {
                            localday = days[i][j];

                            //INTERPOLAÇÃO POR NÚMERO DE EVENTOS POR DIA --------------------------------------------
                            Xmed = (float) eventos_seguidos[localday];
                            Ymed = Ymin + (Xmed - Xmin) / (Xmax - Xmin) * (Ymax - Ymin);
                            sat = Ymed;
                            RGBColor = Color.getHSBColor(0.36f, sat, 1f);
                            hexColor = "#" + Integer.toHexString(RGBColor.getRGB()).substring(2);
                            // --------------------------------------------------------------------------------------

                            //DIAS JÁ PASSADOS EM CINZA
                            if (int_selectedYear < int_currentYear) {
                                if (eventos_seguidos[localday] == 0) {
                                    cores[localday] = "#e6e6e6";
                                } else {
                                    cores[localday] = "#bfbfbf";
                                }
                            } else if (int_selectedYear == int_currentYear) {
                                if (int_selectedMonth < int_currentMonth) {
                                    if (eventos_seguidos[localday] == 0) {
                                        cores[localday] = "#e6e6e6";
                                    } else {
                                        cores[localday] = "#bfbfbf";
                                    }
                                } else if (int_selectedMonth == int_currentMonth) {
                                    if (days[i][j] < int_currentDay) {
                                        if (eventos_seguidos[localday] == 0) {
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
                  }

                    //FIM USUÁRIO COMUM --------------------------------------------------------------------                    
                    
                    
                    //PARA USUÁRIO ADMIN --------------------------------------------------------------------
                    
                    if (admin2) {
                        
                    Realiza trr = new Realiza();
                    RealizaDO realizaDO = new RealizaDO();
                    Membro trm2 = new Membro();
                    int geID;                           
                    
                    //CONSTROI ARRAY LINEAR DE NÚMERO DE EVENTOS ADMINISTRADOS POR DIA, PARA UM MÊS                   
                    int[] eventos_admined = new int[40]; // Começamos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa eventos com zeros
                        eventos_admined[k] = 0;
                    }                            
                        
                        if (!eventos_do_Mes.isEmpty()) {
                            for (EventoDO evento_temp : eventos_do_Mes) {
                                eveID = evento_temp.getId(); // Pegamos o ID do evento da iteracao
                                realizaDO = trr.buscarPorEVE(eveID);
                                geID = realizaDO.getGEid(); // Pegamos o ID do GE que realiza o evento da iteracao
                                if(trm2.isADM(geID, usrID)){
                                    date_tempday = evento_temp.getData(); // pega a data com formato Date
                                    tempday2 = date_tempday.getDate(); // converte a data para Int
                                    eventos_admined[tempday2]++; //adiciona no Array de eventos administrados                                                                
                                }
                                if (trs.isSeguindo(usrID, eveID)) { //Se o usuário seguir o evento
                                    date_tempday = evento_temp.getData(); // pega a data com formato Date
                                    tempday2 = date_tempday.getDate(); // converte a data para Int
                                    eventos_seguidos[tempday2]++; //adiciona no Array de eventos seguidos
                                }

                            }
                        }
                        
                    //CORES[] SEGUIDOS ---------------------------------------------------
                    //XMÁX e XMIN (maximo e minimo numero de eventos seguidos em um mes)
                    
                    Xmax=0;
                    Xmin=0;
                    
                    for (int k = 0; k < 40; k++) {
                        if ((float) eventos_seguidos[k] > Xmax) {
                            Xmax = (float) eventos_seguidos[k];
                        }
                        Xmin = Xmax;
                        if ((float) eventos_seguidos[k] < Xmin) {
                            Xmin = (float) eventos_seguidos[k];
                        }
                    }

                    //Caso não haja eventos no mês, colocamos (Xmax = 1) para não causar erros na tabela de cores
                    if (Xmax == 0) {
                        Xmax = 1;
                    }

                    Ymin = 0f; // SATURAÇÃO MÍNIMA
                    Ymax = 1.0f; // SATURAÇÃO MÁXIMA

                    float sat;
                    Color RGBColor;
                    String hexColor;

                    //---------------------------------------------------------
                    //CONSTROI ARRAY LINEAR DE CORES POR DIA, PARA UM MÊS    
                    String[] cores_seguidos = new String[40]; // Começamos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa cores com vazios
                        cores_seguidos[k] = "";
                    }

                    for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
                        for (int j = 0; j < 7; j++) {
                            localday = days[i][j];

                            //INTERPOLAÇÃO POR NÚMERO DE EVENTOS POR DIA --------------------------------------------
                            Xmed = (float) eventos_seguidos[localday];
                            Ymed = Ymin + (Xmed - Xmin) / (Xmax - Xmin) * (Ymax - Ymin);
                            sat = Ymed;
                            RGBColor = Color.getHSBColor(0.36f, sat, 1f);
                            hexColor = "#" + Integer.toHexString(RGBColor.getRGB()).substring(2);
                            // --------------------------------------------------------------------------------------

                            //DIAS JÁ PASSADOS EM CINZA
                            if (int_selectedYear < int_currentYear) {
                                if (eventos_seguidos[localday] == 0) {
                                    cores_seguidos[localday] = "#e6e6e6";
                                } else {
                                    cores_seguidos[localday] = "#bfbfbf";
                                }
                            } else if (int_selectedYear == int_currentYear) {
                                if (int_selectedMonth < int_currentMonth) {
                                    if (eventos_seguidos[localday] == 0) {
                                        cores_seguidos[localday] = "#e6e6e6";
                                    } else {
                                        cores_seguidos[localday] = "#bfbfbf";
                                    }
                                } else if (int_selectedMonth == int_currentMonth) {
                                    if (days[i][j] < int_currentDay) {
                                        if (eventos_seguidos[localday] == 0) {
                                            cores_seguidos[localday] = "#e6e6e6";
                                        } else {
                                            cores_seguidos[localday] = "#bfbfbf";
                                        }
                                    } else {
                                        cores_seguidos[localday] = hexColor;
                                    }
                                } else {
                                    cores_seguidos[localday] = hexColor;
                                }
                            } else {
                                cores_seguidos[localday] = hexColor;
                            }
                        }
                    }
                        
                    //CORES[] ADMINED ---------------------------------------------------
                    //XMÁX e XMIN (maximo e minimo numero de eventos seguidos em um mes)
                    
                    Xmax=0;
                    Xmin=0;
                    
                    for (int k = 0; k < 40; k++) {
                        if ((float) eventos_admined[k] > Xmax) {
                            Xmax = (float) eventos_admined[k];
                        }
                        Xmin = Xmax;
                        if ((float) eventos_admined[k] < Xmin) {
                            Xmin = (float) eventos_admined[k];
                        }
                    }

                    //Caso não haja eventos no mês, colocamos (Xmax = 1) para não causar erros na tabela de cores
                    if (Xmax == 0) {
                        Xmax = 1;
                    }

                    Ymin = 0f; // SATURAÇÃO MÍNIMA
                    Ymax = 1.0f; // SATURAÇÃO MÁXIMA
                    
                    sat = 0f;
                    RGBColor=new Color(0,0,0);
                    hexColor = "";                    

                    //---------------------------------------------------------
                    //CONSTROI ARRAY LINEAR DE CORES POR DIA, PARA UM MÊS    
                    String[] cores_admined = new String[40]; // Começamos a usar a partir do Dia 1

                    for (int k = 0; k < 40; k++) { // Inicializa cores com vazios
                        cores_admined[k] = "";
                    }

                    for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
                        for (int j = 0; j < 7; j++) {
                            localday = days[i][j];

                            //INTERPOLAÇÃO POR NÚMERO DE EVENTOS POR DIA --------------------------------------------
                            Xmed = (float) eventos_admined[localday];
                            Ymed = Ymin + (Xmed - Xmin) / (Xmax - Xmin) * (Ymax - Ymin);
                            sat = Ymed;
                            RGBColor = Color.getHSBColor(0f, sat, 1f);
                            hexColor = "#" + Integer.toHexString(RGBColor.getRGB()).substring(2);
                            // --------------------------------------------------------------------------------------

                            //DIAS JÁ PASSADOS EM CINZA
                            if (int_selectedYear < int_currentYear) {
                                if (eventos_admined[localday] == 0) {
                                    cores_admined[localday] = "#e6e6e6";
                                } else {
                                    cores_admined[localday] = "#bfbfbf";
                                }
                            } else if (int_selectedYear == int_currentYear) {
                                if (int_selectedMonth < int_currentMonth) {
                                    if (eventos_admined[localday] == 0) {
                                        cores_admined[localday] = "#e6e6e6";
                                    } else {
                                        cores_admined[localday] = "#bfbfbf";
                                    }
                                } else if (int_selectedMonth == int_currentMonth) {
                                    if (days[i][j] < int_currentDay) {
                                        if (eventos_admined[localday] == 0) {
                                            cores_admined[localday] = "#e6e6e6";
                                        } else {
                                            cores_admined[localday] = "#bfbfbf";
                                        }
                                    } else {
                                        cores_admined[localday] = hexColor;
                                    }
                                } else {
                                    cores_admined[localday] = hexColor;
                                }
                            } else {
                                cores_admined[localday] = hexColor;
                            }
                        }
                    }
                    
                    List<String> nullColors = Arrays.asList("#e6e6e6","#bfbfbf","#ffffff");

                    //MESCLA CORES[] SEGUIDOS COM CORES[] ADMINED

                    for (int k = 0; k < 40; k++) {
                        if(!nullColors.contains(cores_seguidos[k]) && nullColors.contains(cores_admined[k])){
                            cores[k] = cores_seguidos[k];
                        }
                        else if(nullColors.contains(cores_seguidos[k]) && !nullColors.contains(cores_admined[k])){
                            cores[k] = cores_admined[k];
                        }
                        else if(!nullColors.contains(cores_seguidos[k]) && !nullColors.contains(cores_admined[k])){
                            cores[k] = "#f600ff";
                        }                         
                    }

                    }                    

                    //FIM USUÁRIO ADMIN --------------------------------------------------------------------                   

                // PRINTA CALENDARIO    
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
