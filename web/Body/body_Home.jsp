<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%@page import="data.EventoDO"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.Seguindo" %>
<%@ page import="data.SeguindoDO" %>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import= "data.GEDO"%>
<%@ page import= "transacoes.GE"%>
<%@ page import= "data.RealizaDO"%>

<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
 UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
 String nome = usuario.getNome();
%>

<h1><center> Home </center> </h1>

<h2><font face="verdana">Ol�,<%=nome%>  </font><h2>            
<h2><font face="verdana"> Grupos de extens�o </font><h2>
<p><font size="2" face="verdana"><a href="/agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 


<%
    SeguindoDO seguindo = new SeguindoDO();
    Seguindo seguindotn = new Seguindo();
    List<SeguindoDO> lista = new ArrayList<SeguindoDO>();
    lista = seguindotn.pesquisarPorUSUid(usuario.getId());
    if(lista != null){
        if (lista.size() !=0){ 
           %><p>Voc� segue estes eventos:</p><br><%}
        else{ %><p>Voc� n�o segue evento algum!</p><br><% }
%>
        <center>
        <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extens�o
<%            
        List<EventoDO> lista_eventos = new ArrayList<EventoDO>();
        List<GEDO> lista_GE = new ArrayList<GEDO>();
        for(int i=0; i < lista.size(); i++) {
            SeguindoDO seguido = lista.get(i);
            int EVEid = seguido.getEveId();
            
            Evento eventotn = new Evento();
            EventoDO evento = eventotn.buscar(EVEid);
            lista_eventos.add(evento);
            String nomeEven = evento.getNome();
            
            Realiza realizatn = new Realiza();
            RealizaDO realiza = realizatn.buscarPorEVE(EVEid);            
            int GEid = realiza.getGEid();
            
            GE getn = new GE();
            GEDO ge = getn.buscar(GEid);
            lista_GE.add(ge);
            String nomeGE = ge.getNome();
%>
            <TR>
                <TD> <%=nomeEven%> </TD> <TD><%=nomeGE%></TD>
            </TR>
<%      }
%>
        </table>
        </center>
<p>Os seus pr�ximos eventos nessa semana s�o:</p><br>
        <center>
        <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extens�o
<%  for(int i=0; i < lista.size(); i++){
%>
        <TR>
            <TD> <%=lista_eventos.get(i).getNome()%> </TD> <TD><%=lista_GE.get(i).getNome()%></TD>
        </TR>
<%        
    }
%>
        </table>
        </center><br>    
<%    }
    else{
%>

<p>Voc� n�o segue evento algum!</p><br>
<%
    }  

%>


<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home </center> </h1>
 <h2><font face="verdana"> Grupos de extens�o (PARA TESTAR HOME ESPECIFICA LOGAR COM: alex sen)</font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 

<%    
   }
%>
<p>Calend�rio</p>
<%@include  file="Calendario/body_Calendario.jsp"%>

</font>
</body>
</html>
