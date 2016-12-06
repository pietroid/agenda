
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
      <li><a href="/agenda/ListadosGE.jsp">Grupos de ExtensÃ£o</a></li>
      <li><a href="/agenda/Calendario.jsp">Calendário Geral</a></li>
  
  <%
        UsuarioDO usr= (UsuarioDO)session.getAttribute("Usuario");
        int usrID = usr.getId();
        Membro tr = new Membro();
        boolean admin = false;
        boolean superuser;
        
        //Relacoes de Membro para os quais o usuario Ã© ADM 
        List<MembroDO> lm = tr.AdminedGroups(usrID);
        
        if(lm != null){
            admin = true;
        }
        
        superuser = usr.isSuperUser();
        
        //USUÃRIO GENÃRICO
        if(usr == null){
           %><li style="float:right"><a href="Perfil.jsp">Criar Perfil</a></li><%
           %><li style="float:right"><a href="/agenda/LoginOut.jsp">Login</a></li><%  
        }

        //USUÃRIO COMUM
        else if (!admin){
           %><li style="float:right"><a href="Perfil.jsp">Perfil Pessoal</a></li><%
           %><li style="float:right"><a href="/agenda/LoginOut.jsp">Logout</a></li><%             
        }

        //USUÃRIO ADMIN
        else if (admin){
           %><li style="float:right"><a href="Perfil.jsp">Perfil Pessoal e GEs</a></li><%
           %><li style="float:right"><a href="/agenda/LoginOut.jsp">Logout</a></li><%
        }

        //USUÃRIO SUPERUSER
        else if (superuser){
           %><li style="float:right"><a href="PaineldeControle.jsp">Painel de Controle</a></li><%
           %><li style="float:right"><a href="/agenda/LoginOut.jsp">Logout</a></li><%      
        }
  %>
  
</ul>
</body>
</html>
