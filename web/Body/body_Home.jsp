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

<h2><font face="verdana">Ol�, <%=nome%>  </font><h2>            
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
           %><p>Voc� segue estes eventos:</p><br>
             <center>
             <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extens�o
           <%}
        else{ %><p>Voc� n�o segue evento algum!</p><br><% }
            
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
                <TD> <center><a href="Evento.jsp?evento=<%=nomeEven%>"><%=nomeEven%></a><center> </TD>
                <TD><center><a href="GE.jsp?GE=<%=nomeGE%>" ><%=nomeGE%></a><center> </TD>
            </TR>
<%      }
%>
        </table>
        </center>
<%if (lista.size() !=0){ %>
    <p>Os seus pr�ximos eventos nessa semana s�o:</p><br>
        <center>
        <table align="center" border=1 cellpadding=10 width=1000>
            <th> Evento <th>Grupo de extens�o <th> Data
<%}else %><p>Voc� n�o tem eventos essa semana!</p><br> <% 

    for(int i=0; i < lista.size(); i++){
        EventoDO eventoParte = lista_eventos.get(i);
        GEDO ge = lista_GE.get(i);
        
%>
        <TR>
            <TD><center><a href="Evento.jsp?evento = "<%=eventoParte.getNome()%>><%=eventoParte.getNome()%></a></center> </TD>
            <TD><center><a href="GE.jsp?GE = "<%=ge.getNome()%>><%=ge.getNome()%></a></center> </TD>
            <TD><center><%=eventoParte.getData()%></center> </TD>

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
 <h1><center> Home  (PARA TESTAR HOME ESPECIFICA LOGAR COM: alex sen)</center> </h1>
 <h2><font face="verdana"> Grupos de extens�o</font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 

<%    
   }
%>
<p></p>
<%@include  file="Calendario/body_Calendario.jsp"%>

</font>
</body>
</html>
