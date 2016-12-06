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

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>            
<h2><font face="verdana"> Grupos de extensão </font><h2>
<p><font size="2" face="verdana"><a href="/agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extensão</a></font></p> 


<%
    SeguindoDO seguindo = new SeguindoDO();
    Seguindo seguindotn = new Seguindo();
    List<SeguindoDO> lista = new ArrayList<SeguindoDO>();
    lista = seguindotn.pesquisarPorUSUid(usuario.getId());
    if(lista != null){
        if (lista.size() !=0){ 
           %><p>Você segue estes eventos:</p><br><%}
        else{ %><p>Você não segue evento algum!</p><br><% }
%>
        <center>
        <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extensão
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
<p>Os seus próximos eventos nessa semana são:</p><br>
        <center>
        <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extensão
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

<p>Você não segue evento algum!</p><br>
<%
    }  

%>


<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home </center> </h1>
 <h2><font face="verdana"> Grupos de extensão (PARA TESTAR HOME ESPECIFICA LOGAR COM: alex sen)</font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extensão</a></font></p> 

<%    
   }
%>
<p>Calendário</p>
<%@include  file="Calendario/body_Calendario.jsp"%>

</font>
</body>
</html>
