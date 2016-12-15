<%-- 
    Document   : body_FormularioImagensUsuario
    Created on : 07/12/2016, 04:03:07
    Author     : Pedro
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.Usuario" %>
<%@page import="data.UsuarioData"%>

<%
 
   
Usuario us = new Usuario();
UsuarioDO UsuarioImagem = new UsuarioDO();
UsuarioImagem = us.buscarPorUsername("Username");

%>

    <head>
  <title>Calendario Geral</title>
    <style>
    table {
        font-family: "Verdana";
        border-collapse: collapse;
        width: 70%;
    }

    td, th {
        height: 70px;
        border: 3px solid #ddd;
        padding: 8px;
        background-color: #ffffff;
    }

    tr:nth-child(even){background-color: #ffffff;}

    #CalendarioGeral td:hover {background-color: #ddd;}

    th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
    }
    
    #B_navegacao {
        border: 0px;
    }
    
    #B_navegacao td, th {
        border: 0px;
        height: 50px;
    }
    
    </style>
    
    
    <% if(request.getParameter("submit5")!=null){
      if(request.getParameter("foto")=="imagem1") UsuarioImagem.setImagem("/agenda/PastadeImagens/man.png");
      if(request.getParameter("foto")=="imagem2") UsuarioImagem.setImagem("/agenda/PastadeImagens/pink.png");
      if(request.getParameter("foto")=="imagem3") UsuarioImagem.setImagem("/agenda/PastadeImagens/amarelo.png");
      if(request.getParameter("foto")=="imagem4") UsuarioImagem.setImagem("/agenda/PastadeImagens/anonimo.png");


     us.atualizar(UsuarioImagem);
    
    %>Parabéns, seu grupo foi devidamente cadastrado!<%
    
    } 
           
    else{    
    %>
</head>
<FORM action="FormularioImagens.jsp" method="post">
    <br>
     <table align="center" border=3 cellpadding=10 width=100>
  <th colspan =" 4"  align = "center">
       Imagens
  </th>
  
  <tr>
    <td><img src ="/agenda/PastadeImagens/man.png" align="right" width = 250 height =" 300" >
</td>
    <td><img src ="/agenda/PastadeImagens/pink.png" align="right" width = 250 height =" 300" >
</td>
<td><img src ="/agenda/PastadeImagens/amarelo.png" align="right" width = 250 height =" 300" >
</td>
<td><img src ="/agenda/PastadeImagens/anonimo.png" align="right" width = 250 height =" 300" >
</td>
  </tr>
  
  <tr>
      <td><input type="radio" name="foto" value="imagem1" >Imagem 1</td>
      <td><input type="radio" name="foto" value="imagem2" >Imagem 2</td>
      <td><input type="radio" name="foto" value="imagem3" >Imagem 3</td>
      <td><input type="radio" name="foto" value="imagem4" >Imagem 4</td>
  </tr>
  <tfoot width="50">
      <td colspan="4" align=" center" >

<INPUT type="submit" name="submit5" value= "Confirma">   
</FORM> 
          
      </td>
  </tfoot>
     
</table>
     <%}%>
