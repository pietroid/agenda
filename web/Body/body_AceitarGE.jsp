<%-- 
    Document   : body_AceitarGE
    Created on : 06/12/2016, 14:25:36
    Author     : Diego
--%>
<%@page import="java.util.List"%>
<%@page import="data.GEDO"%>
<%@page import="transacoes.GE"%>
<%@page import= "java.util.Date"%>
<%@ page import="transacoes.Usuario"%>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>


<%
GE getn = new GE();
Usuario  ustn = new Usuario();
%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">


    
                <%   

                    List<GEDO> ges = getn.buscaTodosEmEspera();
                    for(int i = 0; i < ges.size(); i++){
                        if(i==0){%>
<h1><center> Solicitações de criação de Grupo de Extensão <center> </h1>
        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                <th>Nome do GE<th>Descrição<th>Tipo<th>Aceitar Solicitação<th>Rejeitar Solicitação</th><%}
                       GEDO ge = ges.get(i);
%>
                
                
                
                <tr>
                    <td><center><%=ge.getNome()%></center>                                
                    <td><center><%=ge.getDescricao()%></center> 
                    <td><center><%=ge.getTipo()%></center>            
                    <td><center><a href="GEAceito.jsp?ACE=<%= ge.getId()%>">ACEITAR</a></center>
                    <td><center><a href="SolicitacaoRejeitada.jsp?REJ=<%= ge.getId()%>">REJEITAR</a></center>
                </tr>

                <%
                }if(ges.size()<1){
              %>  <h1><center>Não há solicitações de criação de GE.<center></h1><%

}%>
            </table>
        </center>
        <BR>
               
            
</font>
</body>
</html>
