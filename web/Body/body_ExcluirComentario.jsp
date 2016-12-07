<%-- 
    Document   : CriarComentario
    Created on : 07/12/2016, 03:07:43
    Author     : Marcus
--%>

<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ComentarioDO"%>
<%@page import="transacoes.Comentario"%>
<%@page import="transacoes.Evento"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Vector" %>

<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <%
            Comentario comentariotn = new Comentario();
            ComentarioDO comentario = new ComentarioDO();
            if (request.getParameter("comentario") != null){
                comentario = comentariotn.buscar(Integer.valueOf(request.getParameter("comentario")));
            }
            if (request.getParameter("comentario") != null){
        %>
        <h1><center>Excluir comentário</center></h1>

            <%
                //Verifica se o usuário está logado
                if (session.getAttribute("Usuario")!=null){
                    UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
                    if (usuario.isSuperUser() == true || usuario.getId() == comentario.getUsuId()){
                        if (request.getParameter("submit") == null){
                            %>
                            <center>
                                 Deseja excluir o comentário?
                                 <FORM action = "ExcluirComentario.jsp?comentario=<%= comentario.getId() %>" method = "post">
                                     <input type="radio" name="acao" value="sim" checked> Sim<br>
                                     <input type="radio" name="acao" value="nao"> Não<br>
                                     <INPUT type="submit" name="submit" value= "Enviar">
                                 </form>
                             </center>
                             <%
                        }
                        else{
                            String action = request.getParameter("acao");
                            boolean excluido = false;
                            if (action != null){
                                if (action.equals("sim")){
                                    excluido = comentariotn.excluir(comentario);
                                }
                                if (excluido == true){
                                    %>
    
                                    <center>
                                        Comentário excluído. <BR>
                                    </center>

                                    <%
                                }
                                else{
                                    %>

                                    <center>
                                        Comentário não exclúido. <BR>
                                    </center>

                                    <%
                                }
                            }
                        }
                    }
                    else pageContext.forward("index.jsp");
                }
                else pageContext.forward("index.jsp");
            }
            else pageContext.forward("index.jsp");
            %>
    </body>
</html>
