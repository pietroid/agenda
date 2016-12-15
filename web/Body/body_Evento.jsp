<%@page import="data.GEDO"%>
<%@page import="transacoes.GE"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
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
<%@page import="data.PontoDeInteresseDO"%>
<%@page import="transacoes.PontoDeInteresse"%>
<%@page import="data.AconteceDO"%>
<%@page import="transacoes.Acontece"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="java.util.Vector" %>
<%@page import="transacoes.Seguindo"%>
<%@page import="data.SeguindoDO"%>


<% 
    if (request.getParameter("evento") != null) {
        Comentario comentariotn = new Comentario();
        Evento eventotn = new Evento();
        Usuario usuariotn = new Usuario();
        PontoDeInteresse poitn = new PontoDeInteresse();
        Realiza realizatn = new Realiza();
        Acontece acontecetn = new Acontece();
        AconteceDO acontece = acontecetn.buscarPorEVEid(Integer.parseInt(request.getParameter("evento")));
        PontoDeInteresseDO poi = poitn.buscar(acontece.getPOI_id());
        Membro membrotn = new Membro();
        UsuarioDO usuario = new UsuarioDO();
        RealizaDO realizador=realizatn.buscarPorEVE(Integer.parseInt(request.getParameter("evento")));
        EventoDO evento = eventotn.buscar(Integer.parseInt(request.getParameter("evento")));
        GE getn=new GE();
        GEDO ge=getn.buscar(realizador.getGEid());
        boolean isAdm=false;
        boolean sUser=false;
        if (session.getAttribute("Usuario") != null){
            usuario = (UsuarioDO) session.getAttribute("Usuario");
            isAdm=membrotn.isADM(ge.getId(),usuario.getId());
            sUser=usuario.isSuperUser();
            /*------ALYSON-------*/
        }
        if(ge.getAutorizado()==1 || isAdm || sUser){
%>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <%if(evento.isAtivo()){ %>
        <h1><center><%= evento.getNome() %></center></h1>
        <h2><center><%= ge.getNome() %></center></h2>
        <%}else{%>
        <h1><center><b style="color:red">EVENTO CANCELADO</b></center></h1>
        <h1><center><%= evento.getNome() %></center></h1>
        <h2><center><%= ge.getNome() %></center></h2>
        <%}%>
        <BR><BR>
        <table align="left" border=1 cellpadding=10 width=500>
            <%
        if (evento.getLink()!=null && !evento.getLink().equals("")){
            %>
            <tfoot>
                <tr><th><a href="<%=evento.getLink()%>" target="_top">Inscrever-se</a></th></tr>
            </tfoot>
            <%
        }
            %>
            <th>Descrição</th>
            <tr>
                <td width=10% height=200> <%= evento.getDescricao() %></td>
            </tr>
        </table>
        <%if(evento.isAtivo()|| isAdm || sUser){ %>
        <table align = "right" border = "1" cellpadding = "10" width = "500">
            <th>Informações</th>
            <tr><td>Data: <%= evento.getData() %></td></tr>
            <tr><td>Horario de inicio: <%= evento.getHoraInicial() %></td></tr>
            <tr><td>Horario de termino: <%= evento.getHoraFinal() %></td></tr>
            <tr><td>Local: <%= poi.getEndereco() %></td></tr>
            <tr><td>Avaliação: <%= evento.getAvaliação() %></td></tr>
        </table>
        <%}%>
        
            <BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
        <table align="left" border=1 cellpadding=10 width=500>
            <% 
        if (usuario != null&& !usuario.isSuperUser()){
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
        if(comentarios.isEmpty()){
            %>
                <tr><td width=10% height=50> Não há comentários para este evento. Seja o primeiro a comentar!</td></tr><%
        }
                %>
        </table>

        <BR><BR><BR><BR><BR><BR><BR><BR><BR>

        <BR><BR><BR><BR><BR>
        
        <!-------------------------------------------------------------------------------------------------->
<!----------------------------- REDIRECIONA PARA FEEDBACK------------------------------------------->
<%   LocalDate localDate = LocalDate.now();
    Date dateNow = Date.valueOf(localDate.toString());
    if(evento.getData().before(dateNow)  && !usuario.isSuperUser() && evento.isAtivo()){        %>
<p align="center"> <b>O que você achou do evento? </b></p> <BR>
<FORM action="/agenda/Feedback.jsp" method="post">  
    <center><INPUT type="submit" name="deixar_feedback" value="Deixe seu feedback" ></center> <BR>
    <input type="hidden" name="id_eve" value="<%=evento.getId()%>">
</form><%}
%>
<!---------------------------FIM DO REDICERIONADOR PARA FEEDBACK.JSP-------------------------------->
<!-------------------------------------------------------------------------------------------------->
        
<BR> <BR>
        <%
        
        List<SeguindoDO> seguindo = new ArrayList<SeguindoDO>();
        Seguindo seguindotn = new Seguindo();
        seguindo = seguindotn.pesquisarPorEVEid(evento.getId());
        int count = 0;
        if (seguindo != null) {
            for (count = 0; count < seguindo.size(); count++);
        }
        if (usuario != null && evento.isAtivo() && !usuario.isSuperUser()){
        %>
            <center><a href="EventoFollow.jsp?eve=<%=evento.getId()%>">Seguir evento</a></center>
            <center><a href="EventoUnfollow.jsp?eve=<%=evento.getId()%>">Deixar de seguir evento</a></center>
        <%
        }
        %>
        <center><a href="ExibirSeguidores.jsp?eve=<%=evento.getId()%>">Clique aqui para ver uma lista dos seguidores do evento</a></center>
            <table align="center">
                <th>
                    Seguidores: <%=count%>
                </th>
            </table>
        <% 
        if (usuario.getNome() != null){
            RealizaDO realiza = realizatn.buscarPorEVE(evento.getId());
            boolean isadm = membrotn.isADM(realiza.getGEid(), usuario.getId());
            if (usuario.isSuperUser() == true || isadm == true){
                %>
        <center> <table align="center" border=1 cellpadding=10 width=500>
                        <tr>
                          <td><a href="CancelarEvento.jsp?evento=<%= evento.getId() %>"><font  color="#ff0000">Cancelar evento</font></a></td>
                          <td><a href="ExcluirEvento.jsp?evento=<%= evento.getId() %>"><font  color="#ff0000">Excluir evento</font></a></td>
                          <td><a href="EditarEvento.jsp?evento=<%= evento.getId() %>"><font  color="#ff0000">Alterar evento</font></a></td>
                        </tr>
            </table></center>
                <%
            }
        }
        %>
        <BR><BR>
        <%if(usuario!=null && !usuario.isSuperUser()){%>
        <p align="center"> <b>Avalie o evento </b></p> <BR>
<FORM action="/agenda/Avaliar.jsp" method="post">  
    <center><INPUT type="submit" name="deixar_feedback" value="Avaliar" ></center> <BR>
    <INPUT type ="hidden" name ="id" value = "<%=evento.getId()%>">
</form><%}%>
    <%
        }else{
pageContext.forward("index.jsp");
}
    }else{ pageContext.forward("index.jsp");}
        %>    
    </body>
</html>
