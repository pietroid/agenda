<%-- 
    Document   : body_SairDoGrupo
    Created on : 15/12/2016, 00:02:06
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
                if (user.getId() == usuario.getId()){
                    if (isadm == false){
                        %>
                            <title>Sair do grupo</title>
                            </head>
                            <body BGCOLOR = #f2f2f2>
                                <font face="verdana">
                                <BR><BR>
                                <%
                                    if (request.getParameter("submit") == null){
                                        %>
                                             <center>
                                                Deseja sair do grupo de extensão <%= ge.getNome() %>?
                                                <FORM action = "SairDoGrupo.jsp?membro=<%= membro.getId() %>" method = "post">
                                                    <input type="radio" name="Eve" value="sim" checked> Sim<br>
                                                    <input type="radio" name="Eve" value="nao"> Não<br>
                                                    <INPUT type="submit" name="submit" value= "Enviar">
                                                </form>
                                            </center>
                                        <%
                                    }
                                    else{
                                        String action = request.getParameter("Eve");
                                        if (action.equals("sim")){ 
                                            membrotn.excluir(membro);
                                            %>
                                                <center> Você saiu do grupo. </center>
                                            <%
                                        }
                                        if (action.equals("nao")) %> <center> Você não saiu do grupo. </center> <%;
                                    }
                    }
                    else %> <center> O ADM de um grupo não pode se excluir. </center> <%;
                }
                else pageContext.forward("index.jsp");
            }
            else pageContext.forward("index.jsp");
        }
        else %> <center> Você precisa estar logado. </center> <%;
%>
    </body>
</html>
