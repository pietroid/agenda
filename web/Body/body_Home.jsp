
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
        if (lista.size() !=0) %><p>Voc� segue estes eventos:</p><br><%;
        else %><p>Voc� n�o segue evento algum!</p><br><% ;
        for(int i=0; i < lista.size(); i++) {
            SeguindoDO seguido = lista.get(i);
            int EVEid = seguido.getEveId();
            Evento evento = new Evento();
            String nomeEven = evento.buscar(EVEid).getNome();
%>
        <TR>
            <TD> <%=nomeEven%> </TD>
        </TR>

<%      }
%>
<p>Os seus pr�ximos eventos s�o:</p><br>
<%  
    }
    else{
%>
<p>Voc� n�o segue evento algum!</p><br>
<%
    }  
<%  
%>


<%    
   }else{ //HOME DESLOGADO

 %>
 <h1><center> Home </center> </h1>
 <h2><font face="verdana"> Grupos de extens�o </font><h2>
<p><font size="2" face="verdana"><a href="/Agenda/ListadosGE.jsp" target="_top">Clique aqui
 para ver uma lista com todos os Grupos de Extens�o</a></font></p> 

<%    
   }
%>
<%@include  file="Calendario/body_Calendario.jsp"%>

</font>
</body>
</html>
