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
 if(session.getAttribute("Usuario")!= null)
 {
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    int IDusuario = usuario.getId();
    String nome = usuario.getNome();
    Membro lista = new Membro();
    List<MembroDO> ListaMembro = lista.buscarPorUSUid(IDusuario);
%>
<h1><center> Perfil <center> </h1>

<h2><font face="verdana">Olá,<%=nome%>  </font><h2>
<h2><font face="verdana"> Interesses </font><h2>
<p><font size="2" face="verdana"><a href="body_GE.jsp">Clique aqui
 para ver uma lista com todos os Grupos do seu interesse</a></font></p> 
<p><font size="2" face="verdana"><a href="body_AltPass.jsp">Clique aqui
 para alterar sua senha</a></font></p>


<%
    
%>
<p><font size="3" face="verdana">Notificações:</p>
<table align="cente" border=3    cellpadding = 10 width=1000   >
    <tr>
        <th>Eventos Cancelados</th>
    </tr>
    <tr>
        <th>Eventos próximos</th>
    </tr>
</table>



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
<center>  <BR><a href="../Cadastro_POI.jsp" target="_top">Quero me Cadastrar</a><center>
 <%      

    }
        
        
%>
</font>
</body>
</html>
