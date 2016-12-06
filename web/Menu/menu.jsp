<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
</style>
</head>
<body>
<font face="verdana">    

<ul>
  <li><a class="active" href="/agenda/index.jsp">Home</a></li>
  <li><a href="/agenda/ListadosGE.jsp">Grupos de Extens�o</a></li>
  <li><a href="/agenda/Calendario.jsp">Calend�rio Geral</a></li>
  
  <%
      UsuarioDO usr_menu= (UsuarioDO)session.getAttribute("Usuario");
      
      
      if(usr_menu == null || usr_menu.isSuperUser()== false){
  %>
  
  <li><a href="Perfil.jsp">Perfil</a></li>
  <%
      }else{ 
  %>
    <li><a href="PaineldeControle.jsp">Painel de Controle</a></li>
  <%
  }
  %>
  
  
  <li style="float:right"><a href="/agenda/LoginOut.jsp">Login/Out</a></li>
</ul>

</body>
</html>
