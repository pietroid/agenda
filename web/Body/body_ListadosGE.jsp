<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%
    GE getn = new GE();
    GEDO ge = new GEDO();
%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center>Grupos de Extensão <center></h1>

<p>
      A imagem deve ser a mesma imagem do grupo quando este se cadastra no sistema. 
      Para não deixar a tabela feia, talvez seja bom verificar no programa em java se a imagem é 
      menor ou igual a a um tamanho (eu usei 120X150 pixels) ou mesmo pedir pro usuário fazer isso.
</p>

<center>
<table align="center" border=1 cellpadding=10 width=1000>
<th>Imagem <th>Grupo de extensão
<tr>
  <td width=10% height=150 ><center><iframe src="../PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" 
          scrolling= no width=120 height=150 ></iframe><center>
              <td><center><a href="../Body/body_GE.jsp" <% request.setAttribute("GEDO", getn.buscar(1)); %>>ThundeRatz</a><center>
</tr>
<tr>
  <td width=10% height=150 ><center><iframe src="../PastadeImagens/GrupodeExtensao2/Grupodeextensao2-imagem1.PNG" 
          scrolling= no width=120 height=150></iframe><center>
  <td><center><a href="../Body/body_GE.jsp" <% request.setAttribute("GEDO", getn.buscar(2)); %>>Poli Social</a><center><center>
</tr>
<tr>
  <td width=10% height=150 ><center><iframe src="../PastadeImagens/GrupodeExtensao3/Grupodeextensao3-imagem1.PNG" 
          scrolling= no width=120 height=150></iframe><center>
  <td><center><a href="../Body/body_GE.jsp" <% request.setAttribute("GEDO", getn.buscar(3)); %>>Matemática em Movimento</a><center><center>
</tr>
</table>
<center>
    <BR>
    <BR>
    Deseja cadastrar um novo grupo de extensão?
    
    
<%
    if(session.getAttribute("Usuario")!= null) //HOME LOGADO
    {
        
        %>
        <FORM action="body_Cadastro_GE.jsp" method="post">
        <INPUT type="submit" name="submit" value="Cadastrar">    

<%    
   }else{ //HOME DESLOGADO

 %>
        Você precisar Logar antes
        <FORM action="body_LoginOut.jsp" method="post">
        <INPUT type="submit" name="submit" value="Cadastrar">    
 
 
 
<%    
   }
%>
    
    
</body>
</html>