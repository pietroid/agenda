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
        if ((request.getParameter("nome") == null)&&(request.getParameter("submit")==null)) {
            UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
           // UsuarioDO usuario = new UsuarioDO();
            List<PreferenciaDO> listaPreferencia = new ArrayList<PreferenciaDO>();
            Preferencia preferenciatn = new Preferencia();
            listaPreferencia = preferenciatn.pesquisarPorUser(usuario);
            if (listaPreferencia != null && listaPreferencia.size() != 0) {
    %>
                <h1><center>Você segue os seguintes grupos:</center></h1>
                <table align="center" border=1 cellpadding=10 width=1000>
                    <th colspan="3">Preferencias</th>
    <%
                for (int i = 0; i < listaPreferencia.size(); i++) {
                    GEDO GE = new GEDO();
                    GE GEtn = new GE();
                    GE = GEtn.buscar(listaPreferencia.get(i).getGEid());
    %>
                        <tr>
                            <td colspan="3">
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
        else if (request.getParameter("nome").equals("Adicionar")&&(request.getParameter("submit")==null)) {
            
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
    else if (request.getParameter("nome").equals("Adicionar")&&(request.getParameter("submit")==null)){
        
    %>
    <%
    }    
    else if (request.getParameter("nome").equals("Excluir")&&(request.getParameter("submit")==null)){
%>Escolha o grupo de extensão que você quer excluir <%
        Preferencia preferenciatn = new Preferencia();
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
        List<PreferenciaDO> lista_preferencias = new ArrayList<PreferenciaDO>();
        lista_preferencias = preferenciatn.pesquisarPorUser(usuario);
%>
        <form action="PreferenciaExcluir.jsp">
            <select name ="grupo">
<%      for(int i=0; i < lista_preferencias.size(); i++) {
            PreferenciaDO preferencia = lista_preferencias.get(i);
            int GEid = preferencia.getGEid();
            GE getn = new GE();
            GEDO ge = getn.buscar(GEid);            
%>          
            <option label="<%=ge.getNome()%>" value="<%=ge.getId()%>"><%=ge.getNome()%></option>
<%}%>
            </select>
            <input type="submit" value="Excluir"></form>
    
<% 
    }
    else if(request.getParameter("submit") != null){
        %>oi <%= request.getParameter("grupo")%><%
        int GEid = Integer.parseInt(request.getParameter("grupo"));
        Preferencia preferenciatn = new Preferencia();
        boolean update = preferenciatn.excluirid(GEid);
        if (update){ %>Exclusão feita com sucesso!<%};
        if(!update) { %>Houve uma falha na exclusão <% };

    }
%>
</html>
