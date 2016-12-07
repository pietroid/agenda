<%@page import="java.util.ArrayList"%>
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
<%@page import="transacoes.Seguindo"%>
<%@page import="data.SeguindoDO"%>

<% 
    if (request.getParameter("evento") != null && request.getParameter("eve") == null){
        Comentario comentariotn = new Comentario();
        Evento eventotn = new Evento();
        Usuario usuariotn = new Usuario();
        Realiza realizatn = new Realiza();
        Membro membrotn = new Membro();
        UsuarioDO usuario = new UsuarioDO();
        EventoDO evento = eventotn.buscar(Integer.parseInt(request.getParameter("evento")));
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
                        <tr><th><a href="CriarComentario.jsp?evento=<%= evento.getId() %>" target="_top">Comentar</a></th></tr>
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
            
            <%if(comentario.getMensagem().equals("")==false){%>
                <tr>
                    <td width=10% height=50> <a href="Usuario.jsp?Usuario=<%= comentario.getUsuId() %>" target ="_top"><%= nome %></a> : <%= comentario.getMensagem() %>
                        <%
                            if (usuario.getNome() != null){
                                if (usuario.isSuperUser() == true || nome.equals(usuario.getNome())){
                                    %>
                                    <a href="ExcluirComentario.jsp?comentario=<%= comentario.getId() %>" target="_top"><font size="2" color="#ff0000">Excluir comentário</font></a>
                                    <%
                                }
                            }
                        %>
                    </td>
                </tr>
                <%
            }
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
    <center><INPUT type="submit" name="deixar_feedback" value="Deixe seu feedback" ></center> <BR>
    <input type="hidden" name="id_eve" value="<%=evento.getId()%>">
</form>
<!---------------------------FIM DO REDICERIONADOR PARA FEEDBACK.JSP-------------------------------->
<!-------------------------------------------------------------------------------------------------->
        
        <BR>
        

        <p align="right"><a href="Calendario.jsp" target="_top">Clique aqui para voltar ao calendário</a></p>
        <BR><BR><BR><BR><BR><BR>
        <%
        if (request.getParameter("eve") == null && session.getAttribute("Usuario") != null){
            List<SeguindoDO> seguindo = new ArrayList<SeguindoDO>();
            Seguindo seguindotn = new Seguindo();
            seguindo = seguindotn.pesquisarPorEVEid(evento.getId());
            int count = 0;
            if (seguindo != null) {
                for (count = 0; count < seguindo.size(); count++);
            }
        %>
            <center><a href="Evento.jsp?eve=<%=evento.getId()%>">Seguir evento</a></center>
            <table align="center">
                <th>
                    Seguidores: <%=count%>
                </th>
            </table>
        <%
        }
        %>
        
        
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
        %>
        <p align="center"> <b>Avalie o evento </b></p> <BR>
<FORM action="/agenda/Avaliar.jsp" method="post">  
    <center><INPUT type="submit" name="deixar_feedback" value="Avaliar" ></center> <BR>
    <INPUT type ="hidden" name ="id" value = "<%=evento.getId()%>">
</form>
    <%
    }
    else if ((request.getParameter("eve")) != null) {
        SeguindoDO seguindo = new SeguindoDO();
        Seguindo seguindotn = new Seguindo();      
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
        Evento eventotn = new Evento();
        EventoDO evento = eventotn.buscar(Integer.parseInt(request.getParameter("eve")));
        List<SeguindoDO> verificaSeUsuarioJaSegueEvento = seguindotn.pesquisarPorUSUid(usuario.getId());
        boolean segue = false;
        for (int i = 0; i < verificaSeUsuarioJaSegueEvento.size(); i++) {
            if (verificaSeUsuarioJaSegueEvento.get(i).getEveId() == evento.getId()) {
                segue = true;
            }
        }
        
        if (segue == true) {
        %>
        <h1 align ="center">
            Você já é um seguidor desse evento!
        </h1>
        <BR>
        <a href ="Evento.jsp">Clique aqui para voltar à página do evento</a>
        <%   
        }
        else { 
            seguindo.setEveId(evento.getId());
            seguindo.setUsuId(usuario.getId());
            if (seguindotn.incluir(seguindo)) {
    %>
            <h1 align="center">
                Você agora é um seguidor do evento <%=evento.getNome()%>!
            </h1>
            <a href ="Evento.jsp">Clique aqui para voltar à página do evento</a>
    <%
            }
            else {
    %>
    Houve um erro! <BR>
        <a href ="Evento.jsp">Clique aqui para voltar à página do evento</a>
    <%
            }
        }
    }
    else pageContext.forward("index.jsp");
        %>    
    </body>
</html>
