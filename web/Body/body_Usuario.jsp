
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@page import= "java.util.Date"%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%  
    
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
   
    
    UsuarioDO usuarioREQ;
    Usuario tru = new Usuario();
    int id = Integer.parseInt(request.getParameter("Usuario"));
    usuarioREQ=tru.buscarPorID(id);
    String username = usuarioREQ.getUsername();
    String bio = usuarioREQ.getBio();    
    String nome = usuarioREQ.getNome();
    String email = usuarioREQ.getEmail();    
   
    Date data = usuarioREQ.getData();
    String curso = usuarioREQ.getCurso();  
    
    Date ingresso = usuarioREQ.getIngresso();

%>

<h1><center><%=nome%></center></h1>
<BR><BR>
<table align="left" border=1 cellpadding=10 width=500>
<th>BIO</th>
<tr>
  <td width=10% height=150><%=bio%></td>
</tr>
</table>

<BR>

<table align="right" border=1 cellpadding=10 width=200>
    <tfoot>
        <tr><th><a href="Fotos.jsp" target="_top">Mais Fotos</a></th></tr>
    </tfoot>
    <td width=200 height=200>
        <img src ="/agenda/PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" width = 100% height=100%>
    </td>
    
</table>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>


<table align="left" border=1 cellpadding=10 width=500>
<th colspan="2">Informações do USUARIO</th>
<tr>
  <td><b>NOME</b></td>
  <td><%=username%></td>
</tr>
<tr>
  <td><b>EMAIL</b></td>
  <td><%=email%></td>
</tr>
<tr>
  <td><b>DATA DE NACIMENTO</b></td>
  <td><%=data%></td>
</tr>
<tr>
  <td><b>Curso</b></td>
  <td><%=curso%></td>
</tr>
<tr>
  <td><b>ano de ingresso</b></td>
  <td><%=ingresso%></td>
</tr>
</table>
<BR><BR><BR><BR><BR><BR><BR><BR>


</body>
</html>


