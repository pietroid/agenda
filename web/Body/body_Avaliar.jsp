<%-- 
    Document   : Avaliar
    Created on : 05/12/2016, 19:21:58
    Author     : fernandohitoshiwatanabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.ComentarioDO"%>
<%@page import="transacoes.Comentario"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Avaliar<center></h1>
                <BR>
                <center>  
                    
    <%
    //Verifica se o usuário está logado
    if (session.getAttribute("Usuario")!=null){
        //Verifica se enviou o comentário
        if (request.getParameter("submit") != null){
            UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
            EventoDO evento = (EventoDO) session.getAttribute("EVEid");
            ComentarioDO c = new ComentarioDO();
            Comentario trc = new Comentario();
            c.setMensagem(request.getParameter("comentario"));
            c.setUsuId(usuario.getId());
            //c.setEveId(evento.getId());
            if (trc.incluir(c)){
                pageContext.forward("PaineldeControle.jsp");
            }
        }
        else{
    %>
                    <form>
                    Nota:<BR>
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="1" checked> opção1
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="2"> opção2
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="3"> opção3
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="4"> opção4
                    <INPUT TYPE="RADIO" NAME="EVEavaliacao" VALUE="5"> opção5
                    </form>
                    Comentário:<BR>
                    <form>
                    <textarea name="EVEcomentario" rows="10" cols="55" maxlength="1000"></textarea>
                    </center>
                    <INPUT type="submit" name="submit" value= "Enviar Avaliação">   
                    <INPUT type="reset" name="reset" value= "Cancelar">
                    </form><BR>         
    </body>
</html>
