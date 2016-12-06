<%-- 
    Document   : body_feedback
    Created on : Dec 6, 2016, 3:20:33 PM
    Author     : netto
--%>

<%@page import="data.FeedbackDO"%>


<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>O que você achou do evento?</center></h1>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<BR>
<center>
        
<%  
//Verifica se o usuário está logado
//avisa para ele que ele deve se logar para comentar
if (session.getAttribute("Usuario")==null){ %>
    <p>Faça seu login para avaliar o evento!</p>
<%}%>
    
<%else{
    FeedbackDO avaliacao = (FeedbackDO) session.getAttribute("Usuario");//ID do usuario%>
    <textarea rows="6" cols="50">
    Digite aqui o que você achou, se gostou ou não. Sua opinião é muito importante!
    </textarea>
<%}%>

    <BR>
    
    <p>Ah, e que nota você daria para o evento?</p>
    
    <BR>
    <form>
  <input type="radio" name="nota" value="Muito bom!" > Muito bom!
  <input type="radio" name="nota" value="Bom" > Bom
  <input type="radio" name="nota" value="Mais ou menos" > Mais ou menos
  <input type="radio" name="nota" value="Ruim" > Ruim
  <input type="radio" name="nota" value="Muito ruim!" > Muito ruim!<BR>
  <center><INPUT type="submit" name="Enviar_Feedback" value="Enviar" ></center> <BR>
  </form>

   
    
    
    </font>
    </body>
    </html>
    
