
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
  <li><a href="/agenda/ListadosGE.jsp">Grupos de Extensão</a></li>
  <li><a href="/agenda/Calendario.jsp">Calendário Geral</a></li>
  <li><a href="/agenda/Perfil.jsp">Perfil</a></li>
  <li style="float:right"><a href="/agenda/LoginOut.jsp">Login/Out</a></li>
</ul>

</body>
</html>