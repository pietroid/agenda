<%-- 
    Document   : body_feedback
    Created on : Dec 6, 2016, 3:20:33 PM
    Author     : netto
--%>


<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>O que você achou deste evento?</center></h1>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <BR>
    <center>
        
      <% //Verifica se o usuário está logado
         //avisa para ele que ele deve se logar para comentar
    if (session.getAttribute("Usuario")!=null){ %>
    <p>Faça seu login para avaliar o evento!</p>
    <%}%>
    
    
    
    
    </font>
    </body>
    </html>
    
