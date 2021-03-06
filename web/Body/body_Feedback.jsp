<%-- 
    Document   : body_feedback
    Created on : Dec 6, 2016, 3:20:33 PM
    Author     : netto
--%>


<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Membro"%>
<%@page import="transacoes.Realiza"%>
<%@page import="data.RealizaDO"%>
<%@page import="transacoes.NotificacaoGeral"%>
<%@page import="data.NotificacaoGeralDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="transacoes.Feedback"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.EventoDO"%>
<%@page import="data.FeedbackDO"%>


<html>
  <head>
        <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 50%;
    }
    td, th {
        height: 50px;
        border: 1px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }
    tr:nth-child(even){background-color: #f2f2f2;}
    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    </style>
    </head>    
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>O que voc� achou do evento?</center></h1>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<BR>
<center>
        
<%  
//Verifica se o usu�rio est� logado
//avisa para ele que ele deve se logar para comentar
 if(session.getAttribute("Usuario")==null){ %>
    <p>Fa�a seu login para avaliar o evento!</p>
<%}

else if(session.getAttribute("Usuario")!=null){
    
if(request.getParameter("submit") != null){

        int FeedbackOK=0;
        UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario"); //User ID
        int EveId=Integer.parseInt(request.getParameter("id_eve"));
        FeedbackDO m = new FeedbackDO();
        Feedback mtn = new Feedback();
        m.setMensagem(request.getParameter("message")); //Atribui mensagem
        m.setUsuId(usuario.getId()); //atribui User ID
        m.setEveId(EveId); //Atribui Event ID
        m.setRating(Integer.parseInt(request.getParameter("nota"))); //Atribui rating
        if (mtn.incluir(m)){
            FeedbackOK = 1;
            %>Feedback enviado. <a href="/agenda/Evento.jsp?evento=<%=EveId%>"> Voltar � pagina do evento</a><%
        }
        else{
            FeedbackOK = 0;
        }

        /*-------------ALYSON-----------*/
        int NotificacaoOK=0; 

        /*Pegando caracteristicas do evento*/
        Evento event = new Evento();
        EventoDO evento = event.buscar(EveId);
        
        /*mensagem*/
        String nomeEvento = evento.getNome();
        String message = "Feedback do evento ";
        /*Criacao do objeto de notificacao geral*/
        NotificacaoGeralDO FeedbackNote = new NotificacaoGeralDO();
        NotificacaoGeral Note = new NotificacaoGeral();
        /*Pegando os usuarios alvo*/
        Realiza eventRealized = new Realiza(); 
        RealizaDO realizacao = eventRealized.buscarPorEVE(EveId);
        int grupoExtensao = realizacao.getGEid();
        
        
        Membro member = new Membro(); 
        List<MembroDO> ListaMembros = member.buscarPorGEidADM(grupoExtensao);
        
        for (MembroDO UsuADM: ListaMembros){
            /*Definindo os atributos da notificacao*/
            FeedbackNote.setUsuId(UsuADM.getUSUid());
            FeedbackNote.setIDassociado(m.getId());
            FeedbackNote.setMensagem(message+nomeEvento);
            FeedbackNote.setClassificacao(2);
            if (Note.incluir(FeedbackNote)){
                NotificacaoOK=1;
            }
            else{
                NotificacaoOK=0;
            }
        }
        
    
    }
        /*------------ALYSON-------------*/

    else {%>

    <textarea name="message" rows="6" cols="50" maxlength="500" form="fdb">
    Digite aqui o que voc� achou, se gostou ou n�o. Sua opini�o � muito importante!
    </textarea>
    
    
    <BR>
    
    <p>Ah, e como foi o evento?</p>
    
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
    
