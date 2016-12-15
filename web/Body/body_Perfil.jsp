
<%@page import="data.GEDO"%>
<%@page import="data.NotificacaoGeralDO"%>
<%@page import="transacoes.NotificacaoGeral"%>
<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Membro"%>
<%@page import="transacoes.GE"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<html>
    <head>
        <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 50%;
    }
    td, th {
        height: 50px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }
    tr:nth-child(even){background-color: #f2f2f2;}
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    </style>
    </head>    
<body BGCOLOR = #f2f2f2>




<%
    /*----------ALYSON-----------*/
    //Rotina para excluir notificacao
    String imagem = "";
    int exclude;
    exclude=0;
    int IDToExclude;
    IDToExclude = 0;
    List<MembroDO> ListaMembro;
    if (request.getParameter("Excluir")!=null){
        exclude = Integer.parseInt(request.getParameter("Excluir"));
    }
    if (request.getParameter("NotId")!=null){
        IDToExclude = Integer.parseInt(request.getParameter("NotId"));
    }
    NotificacaoGeral NotToExclude = new NotificacaoGeral();
    if ((exclude==1)&&(IDToExclude>0)){
        NotToExclude.excluir(IDToExclude);
        IDToExclude = 0;
        exclude = 0; 
    } 
    /*------------ALYSON-------*/
    
 if(session.getAttribute("Usuario")!= null){
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    String nome = usuario.getNome();
    if(usuario.isSuperUser()){
        pageContext.forward("PaineldeControle.jsp");
    }
    
    /*---ALYSON---*/
    
    //Cria uma lista de acordo com o membro para ver se ele possui privilegios de adm de grupo de extensão
    int IDusuario = usuario.getId();
    Membro lista = new Membro();
    ListaMembro = lista.buscarPorUSUid(IDusuario);
    
    //Cria uma lista de notificacoes
    NotificacaoGeral list = new NotificacaoGeral();
    List<NotificacaoGeralDO> ListaNotificacao = list.BuscaNotporUSId(IDusuario);
    String messageNotificacao;
    /*---ALYSON---*/
    
%><center><h1><font face="verdana"> Perfil  </font></h1></center>
                <h1><font face="verdana" size="4">Olá, <%=nome%></font></h1>
        <%
    
    /*----RAFAS2ALYSON---*/
        
    //Verifica se o usuário é Admin de algum grupo de extensão
    boolean AdminGE = false;
    
    Membro mtr = new Membro();
    GE gtr = new GE();
    GEDO ge = new GEDO();
    
    //Relacoes de Membro para os quais o usuario é ADM 
    List<MembroDO> lmadm = mtr.AdminedGroups(usuario.getId());
    
%><h2><font face="verdana" size="4"> Seus Grupos de Extensão </font></h2><%
    
    if(lmadm.isEmpty()){
         %><font face="verdana" size="3">Você não administra nenhum grupo de extensão!</font> <a href="CadastroGE.jsp">Criar grupo de extensão...</a><%
     }
    else{
    %>
    <table>
    <% for (MembroDO membro_temp : lmadm) {%>
    
    <tr>
        <% ge = gtr.buscar(membro_temp.getGEid()); %>
        <td align="center"><font face="verdana" size="3"><a href="GE.jsp?GE=<%= ge.getId()%>"><%=ge.getNome()%></a></font></td>
        <td align="center"><font face="verdana" size="3"><a href="AprovarMembro.jsp?AM=<%= ge.getId()%>">Solicitações de Adesão</a></font></td>
        <td align="center"><font face="verdana" size="3"><a href="CriarEvento.jsp?GE=<%= ge.getId()%>">Criar evento</a></font></td>
    </tr>
    <%}%>
    </table>
    <table align =" left">
        
            <%if (ge.getImagem() != null && !(ge.getImagem().equals(""))){
                    imagem = "/agenda/PastadeImagens/" + usuario.getImagem();
                }%>
        <tr>
            <td>
                <img src ="<%= imagem %>" width = 200 height = 200>
            </td>
        </tr>
    </table>
<%
    }%>
    
    <h2><font face="verdana" size="4"> Interesses </font></h2>
<%// adicionado link para preferencia%>
<p><font size="2" face="verdana"><a href="Preferencia.jsp">Lista dos Grupos de Extensão de seu interesse</a></font></p> 
<h2><font face="verdana" size="4"> Conta </font></h2>
<p><font size="2" face="verdana"><a href="AltPass.jsp">Alterar informações da conta</a></font></p>
<p><font size="2" face="verdana" ><a href="ExcluirMembro.jsp">Excluir sua conta</a></font></p>


<%/*-----ALYSON--------*/
    
    //Verifica se o usuário é lider de algum grupo de extensão
    int LiderGE=0;
    for (MembroDO membro:ListaMembro){
        if (membro.getADM()==1){
            LiderGE = 1;
        }
    }
    
    //Notificacao para usuario ADM
%>
<h2><font size="4" face="verdana"> Notificações:</font></h2>
    <table align="left" border="3"    cellpadding = "10" width="1000"   >
        <tr>
            <th>Eventos Cancelados</th>
            <td>
                <table>
            <%
              
              for (NotificacaoGeralDO notificacaoCanc:ListaNotificacao){
                  messageNotificacao = notificacaoCanc.getMensagem() ;
            %>
                    <%
                        if (notificacaoCanc.getClassificacao()==0){
                    %>
                    <tr>
                        -><%=messageNotificacao %> <a href = "Perfil.jsp?NotId=<%=notificacaoCanc.getId()%>&Excluir=1">[X]Excluir!</a> <br>
                    </tr>
                    <%
                        }
                    }
                    %>
                </table>
                
            </td>
        </tr>
        <tr>
            <th>Eventos Próximos</th>
            <td>
            <table>
            <%
              for (NotificacaoGeralDO notificacaoEVE:ListaNotificacao){
                  messageNotificacao = notificacaoEVE.getMensagem() ;
            %>
                    <%
                        if (notificacaoEVE.getClassificacao()==1){
                    %>
                    <tr>
                        -><%=messageNotificacao %> <a href = "Perfil.jsp?NotId=<%=notificacaoEVE.getId()%>&Excluir=1">[X]Excluir!</a><br>
                    </tr>
                    <%
                        }
                    }
                    %>
                </table>
                
            </td>
        </tr>
        <%if (LiderGE == 1){ %>
        <tr>
            <th>Conflito de Eventos</th>
            <td>
            <table>
            <%
              for (NotificacaoGeralDO notificacaoConf:ListaNotificacao){
                  messageNotificacao = notificacaoConf.getMensagem() ;
            %>
                    <%
                        if (notificacaoConf.getClassificacao()==2){
                    %>
                    <tr>
                        -><%=messageNotificacao %> <a href = "Perfil.jsp?NotId=<%=notificacaoConf.getId()%>&Excluir=1">[X]Excluir!</a><br>
                    </tr>
                    <%
                        }
                }
                    %>
                </table>
                
        </td>
        </tr>
        
        <tr>
            <th>Novos Feedbacks</th>
            <td>
            <table>
            <%
              for (NotificacaoGeralDO notificacaoFeed:ListaNotificacao){
                  messageNotificacao = notificacaoFeed.getMensagem() ;
            %>
                    <%
                        if (notificacaoFeed.getClassificacao()==3){
                    %>
                    <tr>
                        -><%=messageNotificacao %> <a href = "Perfil.jsp?NotId=<%=notificacaoFeed.getId()%>&Excluir=1">[X]Excluir!</a><br>
                    </tr>
                    <%
                        }
                }
                    %>
            </table>   
        </td>
        </tr>
        <%}
        %>
    </table>
<%
/*---------------ALYSON--------------*/
%>

   
<center>


    
<%
   } 
   else{

 %>
 
 <h1><center> Você ainda não tem um Perfil.<center> </h1>
 <h2><center>      Deseja se cadastrar?    <center> </h2>
<center>  <BR><a href="Cadastro.jsp">Quero me Cadastrar</a><center>
 <%      

    }
        
        
%>
<BR><BR><BR><BR><BR>
<BR><BR>
</font>
</body>
</html>
