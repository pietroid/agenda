<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%
    GE getn = new GE();
    GEDO ge = (GEDO)session.getAttribute("GEDO");
%>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1><center>Nome do Grupo</center></h1>
        <BR><BR>

        <p align="left"><a href="/agenda/Calendario.jsp" target="_top">Voltar ao calendário</a></p>
        <BR><BR>

        <table align="left" border=1 cellpadding=10 width=500>
            <th>Descrição do grupo</th>
            <tr>
                <td width=10% height=150> <%= ge.getDescricao() %> </td>
            </tr>
        </table>

        <BR>

        <table align="right" border=1 cellpadding=10 width=200>
            <tfoot>
                <tr><th><a href="../Fotos.jsp" target="_top">Mais Fotos</a></th></tr>
            </tfoot>
            <td width=200 height=200>
                <img src ="/agenda/PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" width = 100% height=100%>
            </td>

        </table>
        <BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>


        <table align="left" border=1 cellpadding=10 width=500>
        <th colspan="2">Informações do grupo</th>
        <tr>
          <td><b>E-mail</b></td>
          <td> <%= ge.getEmail() %></td>
        </tr>
        <tr>
          <td><b>Telefone</b></td>
          <td> <%= ge.getTel()%></td>
        </tr>
        </table>
        <BR><BR><BR><BR><BR><BR><BR><BR>


        <table align="left" border=1 cellpadding=10 width=500>
        <th> 
             <center> <a href="/agenda/AlterarInfoGE.jsp" target="_top"> Alterar Informações </a> </center> 
        </th>
        </table>
        <BR><BR><BR><BR><BR>

        <table align="left" border=1 cellpadding=10 width=500>
        <th colspan="2">Lista de eventos</th>

        </table>

        <BR><BR><BR><BR><BR>

        <table align="left" border=1 cellpadding=10 width=500>
        <tr>
          <td><a href="../agenda/CriarEvento.jsp" <% session.setAttribute("GEDO", ge); %> target="_top"><font size="5" color="#ff0000">Criar evento</font></a></td>
        </tr>
        </table>
    </body>
</html>

