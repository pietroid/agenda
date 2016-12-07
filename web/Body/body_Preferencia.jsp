<%-- 
    Document   : body_preferencia
    Created on : 06/12/2016, 18:59:54
    Author     : daniel
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "data.UsuarioDO"%>
<%@page import = "transacoes.Usuario"%>
<%@page import = "data.EventoDO"%>
<%@page import = "data.PreferenciaDO"%>
<%@page import = "transacoes.Preferencia"%>
<%@page import = "data.GEDO"%>
<%@page import = "transacoes.GE"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        if (request.getParameter("nome") == null) {
            UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
           // UsuarioDO usuario = new UsuarioDO();
            List<PreferenciaDO> listaPreferencia = new ArrayList<PreferenciaDO>();
            Preferencia preferenciatn = new Preferencia();
            listaPreferencia = preferenciatn.pesquisarPorUser(usuario);
            if (listaPreferencia != null && listaPreferencia.size() != 0) {
    %>
                <h1><center>Você segue os seguintes grupos:</center></h1>
                <table align="center" border=1 cellpadding=10 width=1000>
                    <th>Preferencias</th>
    <%
                for (int i = 0; i < listaPreferencia.size(); i++) {
                    GEDO GE = new GEDO();
                    GE GEtn = new GE();
                    GE = GEtn.buscar(listaPreferencia.get(i).getGEid());
    %>
                        <tr>
                            <td>
                                <center><%=GE.getNome()%></center>
                            </td>
                        </tr>
    <%
               }
    %>
                        <tr>
                            <td>
                                <center>
                                    <a href="Preferencia.jsp?nome=Adicionar">
                                        Adicionar preferência</a>
                                </center>
                            </td>
                            <td>
                                <center>
                                    <a href="Preferencia.jsp?nome=Editar">
                                        Editar preferência</a>
                                </center>
                            </td>
                            <td>
                                <center>
                                    <a href="Preferencia.jsp?nome=Excluir">
                                        Excluir preferência</a>
                                </center>
                            </td>
                        </tr>
                    </table>
    <%
            }
        else {
    %>
            <h1><center>Você não segue nenhum grupo de extensão!</center></h1>
            <table align="center" border=1 cellpadding=10 width=170>
                <tr>
                    <td>
                        <a href="Preferencia.jsp?nome=Adicionar" align="center">
                            Adicionar preferência
                        </a>
                    </td>
                </tr>
            </table>
    <%
        }
    }
    %>
    
</html>
