<%-- 
    Document   : body_TirarMembro
    Created on : 14/12/2016, 21:25:19
    Author     : Marcus;
--%>

<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <% 
        Usuario usuariotn = new Usuario();
        GE getn = new GE();
        Membro membrotn = new Membro();
        UsuarioDO usuario = new UsuarioDO();
        MembroDO membro = new MembroDO();
        UsuarioDO user = new UsuarioDO();
        GEDO ge = new GEDO();
        if (session.getAttribute("Usuario") != null){
            usuario = (UsuarioDO) session.getAttribute("Usuario");
            if (request.getParameter("membro") != null){
                membro = (MembroDO) membrotn.buscar(Integer.parseInt(request.getParameter("membro")));
                ge = (GEDO) getn.buscar(membro.getGEid());
                user = (UsuarioDO) usuariotn.buscarPorID(membro.getUSUid());
                boolean isadm = membrotn.isADM(ge.getId(), usuario.getId());
                if (isadm == true){
                    %>
                        <title>Excluir membro</title>
                        </head>
                        <body BGCOLOR = #f2f2f2>
                            <font face="verdana">
                            <%
                                if (request.getParameter("submit") == null){
                                    %>
                                         <center>
                                            Deseja tirar o membro <%= user.getNome() %> do grupo de extensão <%= ge.getNome() %>?
                                            <FORM action = "TirarMembro.jsp?membro=<%= membro.getId() %>" method = "post">
                                                <input type="radio" name="Eve" value="sim" checked> Sim<br>
                                                <input type="radio" name="Eve" value="nao"> Não<br>
                                                <INPUT type="submit" name="submit" value= "Enviar">
                                            </form>
                                        </center>
                                    <%
                                }
                                else{
                                    String action = request.getParameter("submit");
                                    if (action.equals("sim")){ 
                                        membrotn.excluir(membro);
                                        %>
                                            <center> Membro excluído. </center>
                                        <%
                                    }
                                    if (action.equals("nao")) %> <center> Membro não excluído. </center> <%;
                                }
                }
                else %> <center> Você precisa ser o administrador do grupo. </center> <%;
            }
            else pageContext.forward("index.jsp");
        }
        else %> <center> Você precisa estar logado. </center> <%;
%>
    </body>
</html>
