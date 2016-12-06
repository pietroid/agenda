<%-- 
    Document   : body_feedback
    Created on : Dec 6, 2016, 3:20:33 PM
    Author     : netto
--%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>O que voc� achou do evento?</center></h1>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<BR>
<center>
        
<%  //Verifica se o usu�rio est� logado
    //avisa para ele que ele deve se logar para comentar
    if (session.getAttribute("Usuario")==null){ %>
    <p>Fa�a seu login para avaliar o evento!</p>
    <%}
    
else{ %>

    <textarea rows="4" cols="50">
Digite aqui o que voc� achou, se gostou ou n�o. Sua opini�o � muito importante!
    </textarea>

    <%}%>

    <BR>
    <p>Ah, e que nota voc� daria para o evento?</p>
    <BR>
    <form>
  <input type="radio" name="nota" value="Muito bom!" > Muito bom!
  <input type="radio" name="nota" value="Bom" > Bom
  <input type="radio" name="nota" value="Mais ou menos" > Mais ou menos
  <input type="radio" name="nota" value="Ruim" > Ruim
  <input type="radio" name="nota" value="Muito ruim!" > Muito ruim!
    </form>
    
    
    
    
    
    
    </font>
    </body>
    </html>
    
