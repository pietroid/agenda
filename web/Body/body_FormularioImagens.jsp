<%-- 
    Document   : body_FormularioImagens
    Created on : 06/12/2016, 23:05:15
    Author     : Pedro
--%>

<%@page import="data.GEDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@page import="data.GEData"%>

<%
    
GE ge= new GE();
int id =Integer.parseInt(request.getParameter("idGE"));
GEDO ged=new GEDO();
ged=ge.buscar(id);

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
    
    
    <%if(request.getParameter("submit5")!=null){
      ged.setImagem(request.getParameter("nota"));
        boolean update = false;

    ge.atualizar(ged);
    %> <br> Parab�ns, seu grupo foi devidamente cadastrado!<%

    %><%
    
    } 
       
        
    else{    
    %>
</head>
<%if(request.getParameter("submit5")==null){%>
<FORM action="FormularioImagens.jsp" method="post">
    <br>
     <table align="center" border=3 cellpadding=10 width=100>
  <th colspan =" 4"  align = "center">
       Imagens
  </th>
  
  <tr>
    <td><img src ="/agenda/PastadeImagens/caneca.png" align="right" width = 250 height =" 300" >
</td>
    <td><img src ="/agenda/PastadeImagens/livro.png" align="right" width = 250 height =" 300" >
</td>
<td><img src ="/agenda/PastadeImagens/social.png" align="right" width = 250 height =" 300" >
</td>
<td><img src ="/agenda/PastadeImagens/capacete.png" align="right" width = 250 height =" 300" >
</td>
  </tr>
  
  <tr>
      <td><input type="radio" name="nota" value="caneca.png" >Imagem 1</td>
      <td><input type="radio" name="nota" value="livro.png" >Imagem 2</td>
      <td><input type="radio" name="nota" value="social.png" >Imagem 3</td>
      <td><input type="radio" name="nota" value="capacete.png" >Imagem 4</td>
      <INPUT type="hidden" name="idGE" value="<%=ged.getId()%>">
      
      
  </tr>
  <tfoot width="50">
      <td colspan="4" align=" center" >

<INPUT type="submit" name="submit5" value= "Confirma">   
</FORM> 
          
      </td>
  </tfoot>
     
</table>
     <%}}%>