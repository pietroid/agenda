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
    <body>
        <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Excluir ponto de interesse</center></h1>
        <BR>        
        <% 
            UsuarioDO usuario = new UsuarioDO();
            if (session.getAttribute("Usuario") != null){
                usuario = (UsuarioDO) session.getAttribute("Usuario");
                if (usuario.isSuperUser()) { %>
                        Deseja exlcuir um ponto de interesse?
                        <input type="radio" name="POI" value="sim" checked> Sim <BR>
                        <input type="radio" name="POI" value="nao"> Não <BR>       
                    <% String action = request.getParameter("POI");  
                    if (action.equals("sim")) { 
                        if (request.getParameter("submit")==null) { %>
                            <FORM action="ExcluirPOI.jsp" method="post">
                                Escreva o nome do ponto de interesse a ser excluído:
                                <input type="text" name="nome"> <BR>
                                <input type="submit" name="submit" value="Excluir">
                            </FORM>
                        <% } 
                        else {
                            PontoDeInteresseDO PontoDeInteresse = new PontoDeInteresseDO();
                            PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
                            PontoDeInteresse = PontoDeInteressetr.buscarnome(request.getParameter("nome"));
                            if (PontoDeInteresse != null) {
                                Acontece Acontecetr = new Acontece();
                                QG QGtr = new QG();
                                PontoDeInteressetr.excluir(PontoDeInteresse);
                                QGtr.excluir(PontoDeInteresse);
                                Acontecetr.excluir(PontoDeInteresse); %>
                                <center>Ponto de interesse excluído!</center> <BR>
                            <% } 
                        }
                    } 
                }
                else { %>
                    <center>Você não tem permissão para isso.</center> <BR>
                <% }
            }
            else { %>
                <center>Você não está logado.</center> <BR>
            <% } %>                
    </body>
</html>
