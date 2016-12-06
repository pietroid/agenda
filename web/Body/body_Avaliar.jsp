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
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Avaliar<center></h1>
                <BR>
                <center>  
                    <%
                EventoDO us=new EventoDO();
                Evento tr=new Evento();
                us=tr.buscar(Integer.parseInt(request.getParameter("id")));
%>
                    <form>
                    Nota:<BR>
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="1" checked> opção1
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="2"> opção2
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="3"> opção3
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="4"> opção4
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="5"> opção5
                    </form>
                    Comentário:<BR>
                    <form>
                    <textarea name="EVEcomentario" rows="10" cols="55" maxlength="1000"></textarea>
                    </center>
                    <INPUT type="submit" name="submit" value= "Enviar Avaliação">   
                    <INPUT type="reset" name="reset" value= "Cancelar">
                    </form><BR>  
                    
    </body>
</html>
