
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
<body BGCOLOR = #f2f2f2>
<font face="verdana">


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
    
 if(session.getAttribute("Usuario")!= null){
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    String nome = usuario.getNome();
    
    /*---ALYSON---*/
    
    //Cria uma lista de acordo com o membro para ver se ele possui privilegios de adm de grupo de extens�o
    int IDusuario = usuario.getId();
    Membro lista = new Membro();
    List<MembroDO> ListaMembro = lista.buscarPorUSUid(IDusuario);
    
    //Cria uma lista de notificacoes
    NotificacaoGeral list = new NotificacaoGeral();
    List<NotificacaoGeralDO> ListaNotificacao = list.BuscaNotporUSId(IDusuario);
    String messageNotificacao;
    /*---ALYSON---*/
    
    %><h1><center> Perfil <center> </h1>
      <h2><font face="verdana">Ol�,<%=nome%>  </font><h2>
        <%
    
    /*----RAFAS2ALYSON---*/
        
    //Verifica se o usu�rio � Admin de algum grupo de extens�o
    boolean AdminGE = false;
    
    Membro mtr = new Membro();
    GE gtr = new GE();
    GEDO ge = new GEDO();
    
    //Relacoes de Membro para os quais o usuario � ADM 
    List<MembroDO> lmadm = mtr.AdminedGroups(usuario.getId());
    
    %><h2><font face="verdana"> Grupos de Extens�o </font><h2><%
    
    if(lmadm.isEmpty()){
         %>Voc� n�o administra nenhum grupo de extens�o!<%
     }
    else{
    %>
    <table align="center">
    <tr>
      <th>Grupos de Extens�o</th>
    <%for (MembroDO membro_temp : lmadm) {%>
    <tr>
        <% ge = gtr.buscar(membro_temp.getGEid()); %>
        <td align="center"><%=ge.getNome()%></td>
    </tr>
    <%}
    }%>
    
<h2><font face="verdana"> Interesses </font><h2>
<%// adicionado link para preferencia%>
<p><font size="2" face="verdana"><a href="Preferencia.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 

<p><font size="2" face="verdana"><a href="AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>
<p><font size="2" face="verdana" ><a href="ExcluirMembro.jsp">Clique aqui
 para excluir sua conta</a></font></p>


<%/*-----ALYSON--------*/
    
    //Verifica se o usu�rio � lider de algum grupo de extens�o
    int LiderGE=0;
    for (MembroDO membro:ListaMembro){
        if (membro.getADM()==1){
            LiderGE = 1;
        }
    }
    
    //Notificacao para usuario ADM
%>
    <p><font size="3" face="verdana">Notifica��es:</p>
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
            <th>Eventos Pr�ximos</th>
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

<h2> Calend�rio </h2>
<center>
<table align="center" border=1 cellpadding=10 width=1000>
<tr>
<th>Domingo <th>Segunda <th>Ter�a <th>Quarta <th>Quinta <th>Sexta <th>S�bado
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
   } 
   else{

 %>
 
 <h1><center> Voc� ainda n�o tem um Perfil.<center> </h1>
 <h2><center>      Deseja se cadastrar?    <center> </h2>
<center>  <BR><a href="Cadastro.jsp" target="_top">Quero me Cadastrar</a><center>
 <%      

    }
        
        
%>
</font>
</body>
</html>
