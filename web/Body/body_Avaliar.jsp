<%-- 
    Document   : Avaliar
    Created on : 05/12/2016, 19:21:58
    Author     : fernandohitoshiwatanabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.EventoDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Avaliar<center></h1>
                <BR>
                <center>  
                    <% EventoDO us=new EventoDO();
                        Evento tr=new Evento();
                        us = tr.buscar(Integer.parseInt(request.getParameter("id")));
                        %>
                        <form action = "body_Avaliar" method="post"> 
                    Nota:<BR>
                    <INPUT TYPE="RADIO" NAME="avaliacao" VALUE=1 checked> opção1
                    <INPUT TYPE="RADIO" NAME="avaliacao" VALUE=2> opção2
                    <INPUT TYPE="RADIO" NAME="avaliacao" VALUE=3> opção3
                    <INPUT TYPE="RADIO" NAME="avaliacao" VALUE=4> opção4
                    <INPUT TYPE="RADIO" NAME="avaliacao" VALUE=5> opção5
                    <INPUT type="submit" name="Submit" value="avaliar">
                    <INPUT type =" hidden" name =" id" value = <%=request.getParameter("id")%>>
                    </form>
                        
                    <%
                    if(request.getParameter("Submit") != null){
                    int Novaava;
                    Novaava = Integer.parseInt(request.getParameter("avaliacao"));
                    int numava;
                    numava = us.getNumeroava();
                    Novaava = Novaava + us.getAvaliação();
                    numava = numava + 1;
                    int Media;
                    Media = Novaava/numava;
                    us.setAvaliação(Media);
                    tr.atualizar(us);
                    %>
                    Evento Avaliado
                    <%
                    }
                            %>
    </body>
</html>