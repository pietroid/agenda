
<%@page import="data.EventoDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>

<html>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Nome do Evento</center></h1>
<BR><BR>
<table align="left" border=1 cellpadding=10 width=500>
    <tfoot>
        <tr><th><a href="../Isncricao.jsp" <%// request.setAttribute("evento",EventoDO);*/
                   
                   %>target=" _top">Inscrever-se</a></th></tr>
    </tfoot>
<th>Descrição</th>
<tr>
    <td width=10% height=200></td>
</tr>


</table>


        <img src ="../PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" align="right" width = 250 height =" 300" >
    </
    
</table>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>



<BR><BR>


  
<p align="right"><a href="../Calendário.jsp" target=" _top">Clique aqui para voltar ao calendário</a></p>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>

<table align="left" border=1 cellpadding=10 width=500>
<tr>
  <td><a href="../CriarEvento.jsp" target=" _top"><font size="5" color="#ff0000">Criar evento</font></a></td>
  <td><a href="../ExcluirEvento.jsp" target=" _top"><font size="5" color="#ff0000">Excluir evento</font></a></td>
  <td><a href="../AlterarEvento.jsp" target=" _top"><font size="5" color="#ff0000">Alterar evento</font></a></td>
</tr>
</table>

</body>
</html>

