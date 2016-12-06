<%-- 
    Document   : body_Problemas
    Created on : 06/12/2016, 14:25:36
    Author     : Diego
--%>
<%@page import="java.util.List"%>
<%@page import="data.ProblemaDO"%>
<%@page import="transacoes.Problema"%>
<%@page import= "java.util.Date"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>


<%
Problema getn = new Problema();
Usuario  ustn = new Usuario();
%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">


<h1><center> Problemas <center> </h1>

        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                <th>Usuário <th>Problema<th>Data</th>Excluir Notificação
    
                <%   
                    List<ProblemaDO> ges = getn.buscarTodos();
                    for(int i = 0; i < ges.size(); i++){
                       ProblemaDO ge = ges.get(i);
                       int USid = ge.getUserId();
                       UsuarioDO us = ustn.buscarPorID(USid);
                       
                %>    
                <tr>
                    <td><center><a href="Usuario.jsp?Usuario=<%= us.getId()%>"><%= us.getNome() %></a></center>
                    <td><center> <%= ge.getMensagem()%></center>
                    <td><center> <%= ge.getData()%></center>
                    <td><center><a href="ExcluirProblema.jsp?ExcluirProblema=<%= ge.getId()%>"><%= ge.getId() %></a></center>
                </tr>

                <%
                }
                %>
            </table>
        </center>
        <BR>
               
            
</font>
</body>
</html>
