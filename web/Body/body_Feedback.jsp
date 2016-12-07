<%-- 
    Document   : body_feedback
    Created on : Dec 6, 2016, 3:20:33 PM
    Author     : netto
--%>


<%@page import="transacoes.Evento"%>
<%@page import="transacoes.Feedback"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.EventoDO"%>
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
 if(session.getAttribute("Usuario")==null){ %>
    <p>Faça seu login para avaliar o evento!</p>
<%}

else if(session.getAttribute("Usuario")!=null){
    
if(request.getParameter("submit") != null){
        UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario"); //User ID
        int EveId=Integer.parseInt(request.getParameter("id_eve"));
        FeedbackDO m = new FeedbackDO();
        Feedback mtn = new Feedback();
        m.setMensagem(request.getParameter("message")); //Atribui mensagem
        m.setUsuId(usuario.getId()); //atribui User ID
        m.setEveId(EveId); //Atribui Event ID
        m.setRating(Integer.parseInt(request.getParameter("nota"))); //Atribui rating
        if (mtn.incluir(m)){
            pageContext.forward("PaineldeControle.jsp");
        }
    }
    else {%>

    <textarea name="message" rows="6" cols="50" maxlength="500" form="fdb">
    Digite aqui o que você achou, se gostou ou não. Sua opinião é muito importante!
    </textarea>
    
    
    <BR>
    
    <p>Ah, e que nota você daria para o evento?</p>
    
    <BR>
    <form action="Feedback.jsp" method="post" id="fdb">
  <input type="radio" name="nota" value="5" > Muito bom!
  <input type="radio" name="nota" value="4" > Bom
  <input type="radio" name="nota" value="3" > Mais ou menos
  <input type="radio" name="nota" value="2" > Ruim
  <input type="radio" name="nota" value="1" > Muito ruim!
  <center><INPUT type="submit" name="submit" value="Enviar"  ></center> 
  <input type="hidden" name="id_eve" value="<%=request.getParameter("id_eve")%>">
  </form>
    <%}%>
<%}%>
    </font>
    </body>
    </html>
    
