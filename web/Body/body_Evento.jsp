<%@page import="data.EventoDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="data.UsuarioDO"%>
<%@ page import="transacoes.Comentario" %>
<%@ page import="data.ComentarioDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="java.util.Vector" %>

<%
    if (request.getParameter("evento") != null){
        Comentario comentariotn = new Comentario();
        Evento eventotn = new Evento();
        Usuario usuariotn = new Usuario();
        Realiza realizatn = new Realiza();
        Membro membrotn = new Membro();
        UsuarioDO usuario = new UsuarioDO();
        EventoDO evento = eventotn.buscarNome(request.getParameter("evento"));
        if (session.getAttribute("Usuario") != null){
            usuario = (UsuarioDO) session.getAttribute("Usuario");
        }
%>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center><%= evento.getNome() %></center></h1>
        <BR><BR>
        <table align="left" border=1 cellpadding=10 width=500>
            <%
        if (usuario.getNome() != null ){
            %>
            <tfoot>
                <tr><th><a href="Inscricao.jsp" target="_top">Inscrever-se</a></th></tr>
            </tfoot>
            <%
        }
            %>
            <th>Descrição</th>
            <tr>
                <td width=10% height=200> <%= evento.getDescricao() %></td>
            </tr>
        </table>
            
        <table align="center" border=1 cellpadding=10 width=500>
            <% 
        if (usuario.getNome() != null){
            %>
                    <tfoot>
                        <tr><th><a href="CriarComentario.jsp?evento=<%= evento.getNome() %>" target="_top">Comentar</a></th></tr>
                    </tfoot>
            <%
        }
            %>
            <th>Comentários</th>
            <%
        List<ComentarioDO> comentarios = comentariotn.buscarPorEVEid(evento.getId());
        for(int i = 0; i < comentarios.size(); i++){
            ComentarioDO comentario = comentarios.get(i);
            String nome = usuariotn.buscarPorID(comentario.getUsuId()).getNome();
            %>
            
            
                <tr>
                    <td width=10% height=50> <%= nome %>: <%= comentario.getMensagem() %></td>
                </tr>
                <%
        }
                %>
        </table>
            
        <img src ="PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" align="right" width = 250 height =" 300" >

        <BR><BR><BR><BR><BR><BR><BR><BR><BR>

        <BR>
        
        <!-------------------------------------------------------------------------------------------------->
<!----------------------------- REDIRECIONA PARA FEEDBACK------------------------------------------->

<p align="center"> <b>O que você achou do evento? </b></p> <BR>
<FORM action="/agenda/Feedback.jsp" method="post">  
    <center><INPUT type="submit" name="deixar_feedback" value="Deixe sua avaliação" ></center> <BR>
</form>
<!---------------------------FIM DO REDICERIONADOR PARA FEEDBACK.JSP-------------------------------->
<!-------------------------------------------------------------------------------------------------->
        
        <BR>
        

        <p align="right"><a href="Calendário.jsp" target="_top">Clique aqui para voltar ao calendário</a></p>
        <BR><BR><BR><BR>
        
        
        
        <% 
        if (usuario.getNome() != null){
            RealizaDO realiza = realizatn.buscarPorEVE(evento.getId());
            boolean isadm = membrotn.isADM(realiza.getGEid(), usuario.getId());
            if (usuario.isSuperUser() == true || isadm == true){
                %>
                    <table align="left" border=1 cellpadding=10 width=500>
                        <tr>
                          <td><a href="ExcluirEvento.jsp?evento=<%= evento.getNome() %>" target="_top"><font size="5" color="#ff0000">Excluir evento</font></a></td>
                          <td><a href="EditarEvento.jsp?evento=<%= evento.getNome() %>" target="_top"><font size="5" color="#ff0000">Alterar evento</font></a></td>
                        </tr>
                    </table>
                <%
            }
        }
    }
    else pageContext.forward("index.jsp");
        %>    
    </body>
</html>
