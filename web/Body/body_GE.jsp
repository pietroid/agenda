<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>

<%
    if (request.getParameter("GE") != null){
        UsuarioDO usuario = new UsuarioDO();
        if (session.getAttribute("Usuario") != null){
           usuario = (UsuarioDO) session.getAttribute("Usuario");
        }
        GE getn = new GE();
        Evento eventotn = new Evento();
        Membro membrotn = new Membro();
        Realiza realizatn = new Realiza();
        boolean isadm = false;
        boolean superuser = false;
        GEDO ge = getn.buscarNome(request.getParameter("GE")); //
        if (usuario.getNome() != null){
            superuser = usuario.isSuperUser();
            isadm = membrotn.isADM(ge.getId(), usuario.getId());
        }
%>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center><%= ge.getNome() %></center></h1>
        <BR><BR>

        <p align="left"><a href="/agenda/Calendario.jsp" target="_top">Voltar ao calendário</a></p>
        <BR><BR>

        <table align="left" border=1 cellpadding=10 width=500>
            <th>Descrição do grupo</th>
            <tr>
                <td width=10% height=150> <%= ge.getDescricao() %> </td>
            </tr>
        </table>
<%  UsuarioDO solicitar = new UsuarioDO();
    solicitar = (UsuarioDO)session.getAttribute("Usuario");
    if(session.getAttribute("Usuario")!= null){
        Membro GEsolicitar = new Membro();
        int a = ge.getId();
        int relacaomembro = 0;
        List<MembroDO> Lista = GEsolicitar.buscarPorUSUid(solicitar.getId());
        if (Lista != null){
            for(int i = 0; i < Lista.size(); i++){
                MembroDO b = Lista.get(i);
                if (a == b.getGEid()){
                    relacaomembro = 1;
                }
            }
        }
    
    if(relacaomembro==false){
%>
        <BR>
        <table align="right" border=1 cellpadding=10 width=200>
            <tfoot>
                <tr><th><a href="SolicitarAdesao.jsp" target="_top">Solicitar adesão</a></th></tr>
            </tfoot>
        </table>
        <BR><BR><BR><BR>
<%
    }
}

%>        
        
        <table align="right" border=1 cellpadding=10 width=200>
            <tfoot>
                <tr><th><a href="Fotos.jsp" target="_top">Mais Fotos</a></th></tr>
            </tfoot>
            <td width=200 height=200>
                <img src ="/agenda/PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" width = 100% height=100%>
            </td>
        </table>
        <BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
        <table align="left" border=1 cellpadding=10 width=500>
            <th colspan="2">Informações do grupo</th>
            <tr>
                <td><b>E-mail</b></td>
                <td> <%= ge.getEmail() %></td>
            </tr>
            <tr>
                <td><b>Telefone</b></td>
                <td> <%= ge.getTel()%></td>
            </tr>
        </table>
        <BR><BR><BR><BR><BR><BR><BR><BR>
        <%
        if (isadm == true || superuser == true){
        %>
                <table align="left" border=1 cellpadding=10 width=500>
                    <th> 
                         <center> <a href="/agenda/AlterarInfoGE.jsp" target="_top"> Alterar Informações </a> </center> 
                    </th>
                </table>
        <%
        }
        %>
        <BR><BR><BR><BR><BR>
        <table align="left" border=1 cellpadding=10 width=500>
            <th colspan="2">Lista de eventos</th>
            <%
        List<RealizaDO> realizas = realizatn.pesquisar(ge.getId());
        List<EventoDO> eventos = new ArrayList<EventoDO>();
        for(int i = 0; i < realizas.size(); i++){
            eventos.add(eventotn.buscar(realizas.get(i).getEVEid()));
        }
        int j;
        if (eventos.size() > 5) j = 5;
        else j = eventos.size();
        for (int i = 0; i < j; i++){
            EventoDO evento = eventos.get(i);
                %>
            <tr>
                <td><center><a href="Evento.jsp?evento=<%= evento.getNome() %>"><%= evento.getNome() %></a><center>
            </tr>
            <%
        }
        %>
        </table>

        <BR><BR><BR><BR><BR>

        <%
        if(isadm == true || superuser == true){
        %>
            <table align="center" border=1 cellpadding=10 width=500>
                <tr>
                    <td><a href="CriarEvento.jsp?GE=<%= ge.getNome() %>" target="_top"><font size="5" color="#ff0000">Criar evento</font></a></td>
                </tr>
            </table>
    <%      
        }
    }
    else pageContext.forward("index.jsp");
    %>
    <% 
        if(session.getAttribute("Usuario")!= null){
            UsuarioDO SUser = (UsuarioDO)session.getAttribute("Usuario");
            if (SUser.isSuperUser()){
                int idGEexclusao = 0;
                %>
                <FORM action="ExcluirGrupo.jsp" method="post">
                <INPUT type="submit" name="Excluir" value="Excluir Grupo">
                <INPUT type="hidden" name="<%=idGEexclusao%>" value="ge.getId()">
                </FORM>
        
        <%
        
    }    
        }
    
    
    %> 
    </body>
</html>

