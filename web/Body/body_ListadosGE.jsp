<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%
    GE getn = new GE();
    GEDO ge = new GEDO();
%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center>Grupos de Extens�o <center></h1>

<p>
      A imagem deve ser a mesma imagem do grupo quando este se cadastra no sistema. 
      Para n�o deixar a tabela feia, talvez seja bom verificar no programa em java se a imagem � 
      menor ou igual a a um tamanho (eu usei 120X150 pixels) ou mesmo pedir pro usu�rio fazer isso.
</p>

<center>
<table align="center" border=1 cellpadding=10 width=1000>
<th>Imagem <th>Grupo de extens�o
<%   
   
   GE tr= new GE();
   List<GEDO> Lista = tr.ListarGE();
    
   for(GEDO grupo: Lista){
       String nome = grupo.getNome();
       int id   = grupo.getId();
 %>    
<tr>
  <td width=10% height=150 ><center><iframe src="../PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" 
          scrolling= no width=120 height=150 ></iframe><center>
              <td><center><a href="../Body/body_GE.jsp" <% request.setAttribute("GEDO", id); %>><%=nome%></a><center>
</tr>

<%
   }
%>


</table>
<center>
    <BR>
    <BR>
    Deseja cadastrar um novo grupo de extens�o? 
    <BR> <BR>
    
    
<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
        
        %>
        <FORM action="body_Cadastro_GE.jsp" method="post">
        <INPUT type="submit" name="submit3" value="Cadastrar">    

<%    
   }else{ //HOME DESLOGADO

 %>
 <BR>
        Voc� precisar Logar antes
        <FORM action="body_LoginOut.jsp" method="post">
        <INPUT type="submit" name="submit2" value="Logar">    
 
 
 
<%    
   }
%>
    
    
</body>
</html>
