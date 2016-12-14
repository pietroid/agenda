
<%@page import="java.time.LocalDate"%>
<%
    //OBTÉM A DATA ATUAL ------------------------------------------------------  
    LocalDate local2 = LocalDate.now();
    int int_currentYear = local2.getYear();
    int int_currentMonth = local2.getMonthValue();
    int int_currentDay = local2.getDayOfMonth();

    //Strings, caso sejam úteis
    String str_currentYear = new Integer(int_currentYear).toString();
    String str_currentMonth = new Integer(int_currentMonth).toString();
    String str_currentDay = new Integer(int_currentDay).toString();
    //fim data atual

    // DETERMINA A DATA SELECIONADA -------------------------------------------  
    //Na primeira ocorrência, o dia selecionado é a data atual
    int int_selectedYear = int_currentYear;
    int int_selectedMonth = int_currentMonth;

    // Caso o usuário clique nas setas, a data selecionada é atualizada
    String newMonth = request.getParameter("month");
    String newYear = request.getParameter("year");

    if (newMonth != null) {
        int_selectedMonth = new Integer(newMonth).intValue();
    }
    if (newYear != null) {
        int_selectedYear = new Integer(newYear).intValue();
    }
    
    //Strings, caso sejam úteis
    String str_selectedYear = new Integer(int_selectedYear).toString();
    String str_selectedMonth = new Integer(int_selectedMonth).toString();
    
    // fim data selecionada
    
    
    // DETERMINA O NOME DO MÊS -------------------------------------------
    String monthNames[] = {"Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio",
        "Junho",
        "Julho",
        "Agosto",
        "Setembro",
        "Outubro",
        "Novembro",
        "Dezembro"};

    // determine the next/previous month and year.
    // this is really only needed by calendar.jsp, but i moved it here
    // to simplify calendar.jsp.
    int nextYear = int_selectedYear;
    int prevYear = int_selectedYear;

    int prevMonth = int_selectedMonth - 1;
    if (prevMonth == 0) {
        prevMonth = 12;
        prevYear--;
    }

    int nextMonth = int_selectedMonth + 1;
    if (nextMonth == 13) {
        nextMonth = 1;
        nextYear++;
    }

%>


