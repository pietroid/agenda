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


<html>
    <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 70%;
    }
    td, th {
        height: 70px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }
    tr:nth-child(even){background-color: #f2f2f2;}
    td:hover {background-color: #ddd;}
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
       
    /*{
        border: 0px;
        height: 50px;
    }*/
    
    </style>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
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
        GEDO ge = getn.buscar(Integer.parseInt(request.getParameter("GE"))); //
        if (usuario != null){
            superuser = usuario.isSuperUser();
            isadm = membrotn.isADM(ge.getId(), usuario.getId());
        }
%>
        <h1><center><%= ge.getNome() %></center></h1>
        <BR><BR>
        <table align="center" border=1 cellpadding=10 width=200>
            <%
                String imagem = "/agenda/PastadeImagens/padrao/logo.PNG";
                if (ge.getImagem() != null){
                    imagem = "/agenda/PastadeImagens/" + ge.getImagem();
                }
            %>
            <center><img src ="<%= imagem %>" width = 200 height = 200></center>
        </table>
        <BR><BR>
        <table align="center" border=1 cellpadding=10 width=200>
            <tfoot>
            <center><td><th><a href="Fotos.jsp" target="_top">Mais Fotos</a></th></td></center>
            </tfoot>
         </table>
            <br><br>
        <table align="center" border=1 cellpadding=10 width=500>
            <th>Descrição do grupo</th>
            <tr>
                <td width=10% height=150> <%= ge.getDescricao() %> </td>
            </tr>
        </table>
        <br><br>
<%  if(session.getAttribute("Usuario")!= null){
        UsuarioDO solicitar = new UsuarioDO();
        solicitar = (UsuarioDO)session.getAttribute("Usuario");
        Membro GEsolicitar = new Membro();
        int a = ge.getId();
        int relacaomembro = 0;
        List<MembroDO> Lista = GEsolicitar.buscarPorUSUid(solicitar.getId());
        if (Lista != null){
            for(MembroDO b : Lista){
                if (a == b.getGEid()){
                    relacaomembro = 1;
                    if (b.getAprovado()==1){
                        relacaomembro = 2;
                    }
                }
            }
        }
    
    if(relacaomembro == 0){
%>
        <BR>
        <table align="right" border=1 cellpadding=10 width=200>
            <tfoot>
                <tr><th><a href="SolicitarAdesao.jsp" target="_top">Solicitar adesão</a></th></tr>
            </tfoot>
        </table>
        <BR><BR>
<%
    }
    if(relacaomembro == 1){
%>
        <BR>
        <table align="center" border=1 cellpadding=10 width=200>
            <tfoot>
                <tr><th><a href="" target="_top">Aguardando aprovação</a></th></tr>
            </tfoot>
        </table>
        <BR><BR>
        <%
    }   
}
%>        
        
 
        <table align="center" border=1 cellpadding=10 width=500>
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
        <BR><BR>
        <%
        if (isadm == true || superuser == true){
        %>
                <table align="center" border=1 cellpadding=10 width=500>
                    <th> 
                         <center> <a href="/agenda/AlterarInfoGE.jsp" target="_top"> Alterar Informações </a> </center> 
                    </th>
                </table>
        <%
        }
        %>
        <BR><BR>
        <table align="center" border=1 cellpadding=10 width=500>
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
                <td><center><a href="Evento.jsp?evento=<%= evento.getId() %>"><%= evento.getNome() %></a><center>
            </tr>
            <%
        }
        %>
        </table>

        <BR><BR>

        <%
        if(isadm == true || superuser == true){
        %>
            <table align="center" border=1 cellpadding=10 width=500>
                <tr>
                    <td><center><a href="CriarEvento.jsp?GE=<%= ge.getNome() %>" target="_top"><font size="5" color="#ff0000">Criar evento</font></a></center></td>
                </tr>
            </table>
    <%      
        }
    }
else{ pageContext.forward("index.jsp");}
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

