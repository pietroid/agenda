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



            <%if(session.getAttribute("Usuario")!=null && ((UsuarioDO)session.getAttribute("Usuario")).isSuperUser()){%>
        <center>
            
           
    
                <%   
                    List<ProblemaDO> ges = getn.buscarTodos();
                    for(int i = 0; i < ges.size(); i++){
                        
                       if(i==0){%><h1><center> Problemas <center> </h1>
                <table align="center" border=1 cellpadding=10 width=1000>
                <th>Usuário <th>Problema<th>Data<th>Excluir Notificação</th>
                      <%}
                       ProblemaDO ge = ges.get(i);
                       int USid = ge.getUserId();
                       UsuarioDO us = ustn.buscarPorID(USid);
                       
                %>    
                       

                
                
                
                <tr>    
                <% if(USid != 0){%>
                    <td><center><a href="Usuario.jsp?Usuario=<%= us.getId()%>"><%= us.getNome() %></a></center>
                <%}else{%>
                    <td><center>Usuário Anônimo</center><%}%>
                    
                    <td><center> <%= ge.getMensagem()%></center>
                    <td><center> <%= ge.getData()%></center>
                    <td><center><a href="ExcluirProblema.jsp?EXP=<%= ge.getId()%>">EXCLUIR</a></center>
                    
                </tr>

                <%
                }

                if(ges.size()< 1){

              %>  <h1><center>Não há problemas reportados.<center></h1><%
}

                %>
            </table>
        </center>
        <BR>
               
            <%}else{
pageContext.forward("index.jsp");
}%>
</font>
</body>
</html>
