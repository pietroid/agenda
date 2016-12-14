<%-- 
    Document   : body_AlterarInfoGE
    Created on : Dec 4, 2016, 3:02:30 PM
    Author     : jujux
--%>


<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informações do Grupo de Extensão </center> </h1>
<BR>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="java.util.Vector" %>

<center>
<%
    GE GEtr = new GE();
    String Idge = request.getParameter("GEDO");
    GEDO ge =GEtr.buscar(Integer.parseInt(Idge));
    boolean update = false;
    
    if (request.getParameter("submit")== null) {
%>
<FORM action="AlterarInfoGE.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="<%=ge.getNome() %>" ><BR><BR>
Descrição:<BR><INPUT type="text" maxlength="140" name="descricao" value= "<%=ge.getDescricao() %>"> <BR><BR>
E-mail:<BR><INPUT type="text" name="email" value= "<%=ge.getEmail() %>" ><BR><BR>
Ano:<BR><INPUT type="int" name="ano" value= "<%=ge.getAno() %>"><BR><BR>
Site:<BR><INPUT type="text" name="site" value= "<%=ge.getSite() %>"><BR><BR>
Facebook:<BR><INPUT type="text" name="face" value= "<%=ge.getFace() %>"><BR><BR>
Imagem:<BR><INPUT type="text" name="imagem" value= "<%=ge.getImagem() %> "><BR><BR>
Telefone:<BR><INPUT type="text" name="tel" value= "<%=ge.getTel() %>"><BR><BR>
Tipo:<BR><INPUT type="text" name="tipo" value= "<%=ge.getTipo() %>"><BR><BR>
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
      <td><input type="radio" name="foto" value="imagem1" >Imagem 1</td>
      <td><input type="radio" name="foto" value="imagem2" >Imagem 2</td>
      <td><input type="radio" name="foto" value="imagem3" >Imagem 3</td>
      <td><input type="radio" name="foto" value="imagem4" >Imagem 4</td>
  </tr>
     </table>
  <tfoot width="50">
      <td colspan="4" align=" center" >
 <INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
<input type="hidden" name="GEDO" value="<%=request.getParameter("GEDO")%>">
          
      </td>
  </tfoot>
     


</FORM>
<%} else if(request.getParameter("submit")!=null) { 
 
if (request.getParameter("nome")!= null) ge.setNome(request.getParameter("nome"));
if (request.getParameter("descricao")!= null) ge.setDescricao(request.getParameter("descricao"));
if (request.getParameter("email")!= null) ge.setEmail(request.getParameter("email"));
if (request.getParameter("foto")!= null) ge.setImagem(request.getParameter("foto"));
if (request.getParameter("ano")!= null){
    try{
        ge.setAno(Integer.parseInt(request.getParameter("ano")));
    }catch(Exception e){
        %>
<FORM action="AlterarInfoGE.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="<%=ge.getNome() %>" ><BR><BR>
Descrição:<BR><INPUT type="text" maxlength="140" name="descricao" value= "<%=ge.getDescricao() %>"> <BR><BR>
E-mail:<BR><INPUT type="text" name="email" value= "<%=ge.getEmail() %>" ><BR><BR>
Ano:<BR><INPUT type="int" name="ano" value= "<%=ge.getAno() %>"><BR><BR>
Site:<BR><INPUT type="text" name="site" value= "<%=ge.getSite() %>"><BR><BR>
Facebook:<BR><INPUT type="text" name="face" value= "<%=ge.getFace() %>"><BR><BR>
Imagem:<BR><INPUT type="text" name="imagem" value= "<%=ge.getImagem() %> "><BR><BR>
Telefone:<BR><INPUT type="text" name="tel" value= "<%=ge.getTel() %>"><BR><BR>
Tipo:<BR><INPUT type="text" name="tipo" value= "<%=ge.getTipo() %>"><BR><BR>
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
      <td><input type="radio" name="foto" value="imagem1" >Imagem 1</td>
      <td><input type="radio" name="foto" value="imagem2" >Imagem 2</td>
      <td><input type="radio" name="foto" value="imagem3" >Imagem 3</td>
      <td><input type="radio" name="foto" value="imagem4" >Imagem 4</td>
  </tr>
     </table>
  <tfoot width="50">
      <td colspan="4" align=" center" >
 <INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
<input type="hidden" name="GEDO" value="<%=request.getParameter("GEDO")%>">
          
      </td>
  </tfoot>
     


</FORM>
    <%
    }
}
if (request.getParameter("site")!= null) ge.setSite(request.getParameter("site"));
if (request.getParameter("face")!= null) ge.setFace(request.getParameter("face"));
if (request.getParameter("imagem")!= null) ge.setImagem(request.getParameter("imagem"));
if (request.getParameter("tel")!= null) ge.setTel(request.getParameter("tel"));
if (request.getParameter("tipo")!= null) ge.setTipo(request.getParameter("tipo"));
if (request.getParameter("foto")!= null) ge.setImagem(request.getParameter("foto"));

update = GEtr.atualizar(ge);
if (update){%><br> Mudanças efetuadas com sucesso!<%}
else {%><br> Erro ao efetuar mudanças! <%}

}

 %>
</center>
</body>
</html>

