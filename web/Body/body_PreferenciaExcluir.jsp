<%-- 
    Document   : body_PreferenciaExcluir
    Created on : 07/12/2016, 03:43:49
    Author     : Guilherme
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

<%

        int id = Integer.parseInt(request.getParameter("grupo"));
        Preferencia preferenciatn = new Preferencia();
        boolean update = preferenciatn.excluirid(id);
        if (update){ %>Exclus�o feita com sucesso!<%};
        if(!update) { %>Houve uma falha na exclus�o <% };
%>
<BR><a href="Preferencia.jsp" target="_top">Voltar para a p�gina de prefer�ncias</a>
