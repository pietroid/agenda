<%@page import="java.util.Calendar"%>
<%
  // get the current year/month/day
  Calendar theCal = Calendar.getInstance();
  int currentYearInt  = theCal.get(Calendar.YEAR);
  int currentMonthInt = theCal.get(Calendar.MONTH);
  int currentDayInt   = theCal.get(Calendar.DATE);
  String currentYearString  = new Integer(currentYearInt).toString();
  String currentMonthString = new Integer(currentMonthInt).toString();

  // get parameters the user might have sent by clicking fwd or back
  String newMonth = request.getParameter("month");
  String newYear  = request.getParameter("year");

  // reset the month and year if necessary
  if ( newMonth != null )
  {
    currentMonthString = newMonth;
    currentMonthInt = new Integer(currentMonthString).intValue();
  }
  if ( newYear != null )
  {
    currentYearString = newYear;
  }

  // determine the next/previous month and year
 int intMonth = new Integer(currentMonthString).intValue();
  int intYear  = new Integer(currentYearString).intValue();

  // determine the name of the current intMonth
  String monthNames[] = {"Janeiro",
                         "Fevereiro",
                         "Mar�o",
                         "Abril",
                         "Maio",
                         "Junho",
                         "Julho",
                         "Agosto",
                         "Setembro",
                         "Outubro",
                         "Novembro",
                         "Dezembro" };

  String monthName = monthNames[intMonth];

  // determine the next/previous month and year.
  // this is really only needed by calendar.jsp, but i moved it here
  // to simplify calendar.jsp.
  int nextYear = intYear;
  int prevYear = intYear;
  int prevMonth = intMonth-1;
  if ( prevMonth==-1 )
  {
    prevMonth=11;
    prevYear--;
  }
  int nextMonth = intMonth+1;
  if ( nextMonth==12 )
  {
    nextMonth = 0;
    nextYear++;
  }

%>


