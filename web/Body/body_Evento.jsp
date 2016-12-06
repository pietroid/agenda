
<%@page import="java.time.LocalDate"%>
<%@page import="data.EventoDO"%>
<%@page import="transacoes.Evento"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<%
    Evento eventotn = new Evento();
    EventoDO evento = (EventoDO) session.getAttribute("evento");
    session.setAttribute("evento",evento);
    
%>
<html>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<!-------------------------------------------------------------------------------------------------->
<!-- CÓDIGO QUE IMPLEMENTA UM REAL TIME CLOCK PARA ANALISAR SE O EVENTO JÁ ACABOU (EM JavaScript) -->

<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
<!----------------------------------------- FIM do JavaScript -------------------------------------->
<!-------------------------------------------------------------------------------------------------->

<body BGCOLOR = #f2f2f2 onload="startTime()">
<font face="verdana">
<h1><center>Nome do Evento</center></h1>
<BR><BR>
<table align="left" border=1 cellpadding=10 width=500>
    <tfoot>
        <tr><th><a href="Inscricao.jsp" target="_top">Inscrever-se</a></th></tr>
    </tfoot>
<th>Descrição</th>
<tr>
    <td width=10% height=200></td>
</tr>
<tr><th><a href="CriarComentario.jsp" <%
                   
                   %>target="_top">Comentar</a></th></tr>

</table>


        <img src ="PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" align="right" width = 250 height =" 300" >
    </
    
</table>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>



<BR><BR>


  
<p align="right"><a href="Calendário.jsp" target="_top">Clique aqui para voltar ao calendário</a></p>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
<!-------------------------------------------------------------------------------------------------->
<!----------------------------- REDIRECIONA PARA FEEDBACK------------------------------------------->
<% LocalDate localDate = LocalDate.now();%>
<p align="center"> <b>O que você achou do evento? </b></p> <BR>
<FORM action="/agenda/Feedback.jsp" method="post">  
    <center><INPUT type="submit" name="deixar_feedback" value="Deixe sua avaliação" ></center> <BR>
</form>
<!---------------------------FIM DO REDICERIONADOR PARA FEEDBACK.JSP-------------------------------->
<!-------------------------------------------------------------------------------------------------->

<div id="txt"></div>


<table align="left" border=1 cellpadding=10 width=500>
<tr>
  <td><a href="ExcluirEvento.jsp" target="_top"><font size="5" color="#ff0000">Excluir evento</font></a></td>
  <td><a href="EditarEvento.jsp" target="_top"><font size="5" color="#ff0000">Alterar evento</font></a></td>
</tr>
</table>

</body>
</html>

