<%@page import="data.NotificacaoGeralDO"%>
<%@page import="transacoes.NotificacaoGeral"%>
<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Membro"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>


<%
    /*----------ALYSON-----------*/
    //Rotina para excluir notificacao
    int exclude;
    exclude=0;
    int IDToExclude;
    IDToExclude = 0;
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
    
 if(session.getAttribute("Usuario")!= null)
 {
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    String nome = usuario.getNome();
    
    /*---ALYSON---*/
    
    //Cria uma lista de acordo com o membro para ver se ele possui privilegios de adm de grupo de extensão
    int IDusuario = usuario.getId();
    Membro lista = new Membro();
    List<MembroDO> ListaMembro = lista.buscarPorUSUid(IDusuario);
    
    //Cria uma lista de notificacoes
    NotificacaoGeral list = new NotificacaoGeral();
    List<NotificacaoGeralDO> ListaNotificacao = list.BuscaNotporUSId(IDusuario);
    String messageNotificacao;
    /*---ALYSON---*/
%>
<h1><center> Perfil <center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>
<h2><font face="verdana"> Interesses </font><h2>
<%// adicionado link para preferencia%>
<p><font size="2" face="verdana"><a href="Preferencia.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 

<p><font size="2" face="verdana"><a href="AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>
<p><font size="2" face="verdana" ><a href="ExcluirMembro.jsp">Clique aqui
 para excluir sua conta</a></font></p>


<%/*-----ALYSON--------*/
    
    //Verifica se o usuário é lider de algum grupo de extensão
    int LiderGE=0;
    for (MembroDO membro:ListaMembro){
        if (membro.getADM()==1){
            LiderGE = 1;
        }
    }
    ListaMembro.is
    
    //Notificacao para usuario ADM
%>
    <p><font size="3" face="verdana">Notificações:</p>
    <table align="cente" border=3    cellpadding = 10 width=1000   >
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
        
    </table>
<%
/*---------------ALYSON--------------*/
%>

<h2> Calendário </h2>
<center>
<table align="center" border=1 cellpadding=10 width=1000>
<tr>
<th>Domingo <th>Segunda <th>Terça <th>Quarta <th>Quinta <th>Sexta <th>Sábado
</tr>
<tr>
<td> <td> <td> <td> <td>1 <td>2 <td>3
</tr>
<tr>
<td>4 <td>5 <td>6 <td>7 <td>8 <td>9 <td>10
</tr>
<tr>
<td>11 <td>12 <td>13 <td>14 <td>15 <td>16 <td>17
</tr>
<tr>
<td>18 <td>19 <td>20 <td>21 <td>22 <td>23 <td>24
</tr>
<tr>
<td>25 <td>26 <td>27 <td>28 <td>29 <td>30 <td>
</tr>
</table>
    
<center>
    
<%    
   }else{

 %>
 
 <h1><center> Você ainda não tem um Perfil.<center> </h1>
 <h2><center>      Deseja se cadastrar?    <center> </h2>
<center>  <BR><a href="Cadastro.jsp" target="_top">Quero me Cadastrar</a><center>
 <%      

    }
        
        
%>
</font>
</body>
</html>
