<%@page import="data.PreferenciaDO"%>
<%@page import="transacoes.Preferencia"%>
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
    UsuarioDO Usu = (UsuarioDO)session.getAttribute("Usuario");
    if(Usu!= null && !Usu.isSuperUser()) //HOME LOGADO
    {
 
 String nome = Usu.getNome(); 
%>

<h1><center> Home </center> </h1>

<h2><font face="verdana">Olá, <%=nome%>  </font></h2>  



<%if(Usu!=null && !Usu.isSuperUser()){
    List<PreferenciaDO> pref;
    Preferencia preft=new Preferencia();
    pref=preft.pesquisarPorUser(Usu);
    if(pref!=null && pref.size()>0){
        %><table align="left" border="1" cellpadding="10" width="1000">
            <caption align="top"><h2><font face="verdana"> Grupos de extensão que você segue: </font></h2></caption>
            <th> Grupo de extensão </th>
<%
        for(PreferenciaDO pr : pref){
            GE getrn = new GE();
            GEDO ge = getrn.buscar(pr.getGEid());
            ge.getNome();
            %><TR>
                <TD> <center><a href="GE.jsp?GE=<%=ge.getId()%>"><%=ge.getNome()%></a><center> </TD>
            </TR><%
        }%>
        <caption align="bottom"><p><font size="2" face="verdana"><a href="Preferencia.jsp">Visualizar preferências</a></font></p></caption>
        </table>
        <%
    }else{
        %>
        
        Você não segue nenhum grupo de extensão!
    <%
    }
}%>


<BR><BR><BR>

<%
    SeguindoDO seguindo = new SeguindoDO();
    Seguindo seguindotn = new Seguindo();
    List<SeguindoDO> lista = new ArrayList<SeguindoDO>();
    lista = seguindotn.pesquisarPorUSUid(Usu.getId());
    if(lista != null){
        if (lista.size() !=0){ 
%>
             <center>
             <table align="left" border="1" cellpadding="10" width="1000">
                 <caption align="top"><h2>Você segue estes eventos:</h2></caption>
                 <th> Evento</th> <th>Grupo de extensão</th>
           <%}
        else{ %><p>Você não segue evento algum!</p><br><% }
            
        List<EventoDO> lista_eventos = new ArrayList<EventoDO>();
        List<GEDO> lista_GE = new ArrayList<GEDO>();
        for(int i=0; i < lista.size(); i++) {
            SeguindoDO seguido = lista.get(i);
            int EVEid = seguido.getEveId();
            
            Evento eventotn = new Evento();
            EventoDO evento = eventotn.buscar(EVEid);
            lista_eventos.add(evento);
            String nomeEven = evento.getNome();
            int idEven = evento.getId();
            Realiza realizatn = new Realiza();
            RealizaDO realiza = realizatn.buscarPorEVE(EVEid);            
            int GEid = realiza.getGEid();
            
            GE getn = new GE();
            GEDO ge = getn.buscar(GEid);
            lista_GE.add(ge);
            String nomeGE = ge.getNome();
%>
            <TR>
                <TD> <center><a href="Evento.jsp?evento=<%=idEven%>"><%=nomeEven%></a><center> </TD>
                <TD><center><a href="GE.jsp?GE=<%=GEid%>" ><%=nomeGE%></a><center> </TD>
            </TR>
<%      }
%>
        </table>
        </center>   
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<caption></caption>
<%if (lista.size() !=0){ %>
        <center>
        <table align="left" border=1 cellpadding=10 width=1000>
            <caption align="top"><h2>Os seus próximos eventos nessa semana são:</h2></caption>
            <th> Evento <th>Grupo de extensão <th> Data
<%}else %><p>Você não tem eventos essa semana!</p><br> <% 

    for(int i=0; i < lista.size(); i++){
        EventoDO eventoParte = lista_eventos.get(i);
        GEDO ge = lista_GE.get(i);
        
%>
        <TR>
            <TD><center><a href="Evento.jsp?evento=<%=eventoParte.getId()%>"><%=eventoParte.getNome()%></a></center> </TD>
            <TD><center><a href="GE.jsp?GE="<%=ge.getId()%>"><%=ge.getNome()%></a></center> </TD>
            <TD><center><%=eventoParte.getData()%></center> </TD>

        </TR>
<%        
    }
%>
        </table>
        </center><br><BR><BR><BR><BR> 
<%    }
    else{
%>

<caption><p>Você não segue evento algum!</p><br></caption>
<%
    }  

%>

<%@include  file="Calendario/body_Calendario_home.jsp"%>
<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home</center> </h1>
 <h2><font face="verdana"> Olá, bem vindo(a) ao Poli Agenda</font><h2>
<p></p>
<%@include  file="Calendario/body_Calendario.jsp"%>

<%    
   }
%>

</font>
</body>
</html>
