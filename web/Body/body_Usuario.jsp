
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>
<%@page import= "java.util.Date"%>

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
    String imagem = "/agenda/PastadeImagens/padrao/logo.png";
                
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
<%if (usuarioREQ.getImagem() != null && !(usuarioREQ.getImagem().equals(""))){
                    imagem = "/agenda/PastadeImagens/" + usuarioREQ.getImagem();
                }%>
<table align="center" border="1" cellpadding="200" width="200">
    <center><img src =<%=imagem%> width = "150" height="200"></center>
</table>
<BR><BR><BR><BR>


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


