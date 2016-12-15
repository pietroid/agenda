<%-- 
    Document   : body_ExcluirPOI
    Created on : Dec 6, 2016, 10:57:18 PM
    Author     : Michael
--%>
<%@page import="transacoes.QG"%>
<%@page import="transacoes.Acontece"%>
<%@page import="java.util.*" %>
<%@page import="transacoes.PontoDeInteresse" %>
<%@page import="data.PontoDeInteresseDO" %>
<%@page import="data.UsuarioDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Excluir ponto de interesse</center></h1>
        <BR>
    <center>
        <%
            UsuarioDO usuario_exclui_poi = new UsuarioDO();
            usuario_exclui_poi = (UsuarioDO) session.getAttribute("Usuario");
            PontoDeInteresse tpoi = new PontoDeInteresse();
            List<PontoDeInteresseDO> listaPOI = tpoi.ListarPOI();

            if (usuario_exclui_poi != null && usuario_exclui_poi.isSuperUser()) {
                if (request.getParameter("submit") != null) {%>
                    <FORM action="ExcluirPOI.jsp" method="post">
                    <input type="radio" name="POI" value="sim" > Sim <BR>
                    <input type="radio" name="POI" value="nao" checked> Não <BR> 
                    <input type="submit" name="submit2" value="Confirmar">
                    <input type = "hidden" name="excluido" value ="<%=request.getParameter("excluido")%>" >
                    </FORM>
            <%  } else {%>
                    <FORM action="ExcluirPOI.jsp" method="post">
                    <select name="excluido">
                    <%if (listaPOI != null && !listaPOI.isEmpty()) {
                        for (PontoDeInteresseDO poi : listaPOI) {
                        %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                        }
                    }%>
                    <BR>
                    <input type="submit" name="submit" value="Confirmar">
                    </select>
                    </FORM>                                

            <%  }
                String action = request.getParameter("POI");
                if (request.getParameter("submit2") != null && action != null && action.equals("sim")) {
                    PontoDeInteresseDO Ponto = new PontoDeInteresseDO();
                    PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
                    Ponto.setId(Integer.parseInt(request.getParameter("excluido")));
                    if (Ponto != null) {
                        if (PontoDeInteressetr.excluir(Ponto)) {
                            pageContext.forward("index.jsp");
                        } else {
                        %> Não foi possível excluir pois há eventos nesse Ponto de Interesse<%
                        }
                    } 
                }
            }else { %>
                    Você não tem permissão para isso. <BR>
          <%}   %>  
</center>
</body>
</html>
