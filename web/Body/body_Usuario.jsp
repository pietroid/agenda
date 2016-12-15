
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@page import= "java.util.Date"%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">

<%  
    

   
    
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

<table align="right" border="1" cellpadding="10" width="200">
    
    <td width=200 height=200>
        <img src ="/agenda/PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" width = 100% height=100%>
    </td>
    
</table>
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>


<table align="left" border="1" cellpadding="10" width="500">
<th colspan="2">Informações do USUARIO</th>
<tr>
  <td><b>Username</b></td>
  <td><%=username%></td>
</tr>
<tr>
  <td><b>E-mail</b></td>
  <td><%=email%></td>
</tr>
<tr>
  <td><b>Data de entrada</b></td>
  <td><%=data%></td>
</tr>
<tr>
  <td><b>Curso</b></td>
  <td><%=curso%></td>
</tr>
<tr>
  <td><b>Ano de ingresso</b></td>
  <td><%=ingresso%></td>
</tr>
<BR><BR>
<%UsuarioDO curr_user=(UsuarioDO)session.getAttribute("Usuario");
    if(curr_user!=null && curr_user.isSuperUser()){
%><caption align="bottom"><center><a style="color:red" size="6" href="ExcluirOutroMembro.jsp?id=<%=id%>">Excluir Usuário</a></center></caption><% 
    }%>
</table>

<BR><BR><BR><BR><BR><BR><BR><BR>
<BR><BR><BR><BR><BR><BR><BR><BR>
<BR><BR><BR><BR><BR><BR><BR><BR>
</body>
</html>


