<%-- 
    Document   : body_AlterarInfoGE
    Created on : Dec 4, 2016, 3:02:30 PM
    Author     : jujux
--%>


<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informações do Grupo de Extensão <center> </h1>
<BR>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="java.util.Vector" %>


<center>
<%
    GE GEtr = new GE();
    String Idge = request.getParameter("GEDO");
    GEDO ge =GEtr.buscar(Integer.parseInt(Idge));
      
    if (request.getParameter("submit")== null) {%>
<FORM action="AlterarInfoGE.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="" ><BR><BR>
Descrição:<BR><INPUT type="text" maxlength="140" name="descrição" value= ""> <BR><BR>
E-mail:<BR><INPUT type="text" name="email" value= ""><BR><BR>
Ano:<BR><INPUT type="int" name="ano" value= ""><BR><BR>
Site:<BR><INPUT type="text" name="site" value= ""><BR><BR>
Facebook:<BR><INPUT type="text" name="face" value= ""><BR><BR>
Imagem:<BR><INPUT type="text" name="imagem" value= ""><BR><BR>
Telefone:<BR><INPUT type="text" name="tel" value= ""><BR><BR>
Tipo:<BR><INPUT type="text" name="tipo" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
<input type="hidden" name="GEDO" value="<%=request.getParameter("GEDO")%>">
</FORM>
<%} else if(request.getParameter("submit")!=null ) { 
 
if (request.getParameter("nome")!= null) ge.setNome(request.getParameter("nome"));
if (request.getParameter("descrição")!= null) ge.setDescricao(request.getParameter("descrição"));
if (request.getParameter("email")!= null) ge.setEmail(request.getParameter("email"));
if (request.getParameter("ano")!= null){
    try{
        ge.setAno(Integer.parseInt(request.getParameter("ano")));
    }catch(Exception e){
        %>
<FORM action="AlterarInfoGE.jsp" method="post">
Nome:<BR><INPUT type="text" maxlenght="140" name="nome" value="" ><BR><BR>
Descrição:<BR><INPUT type="text" maxlength="140" name="descrição" value= ""> <BR><BR>
E-mail:<BR><INPUT type="text" name="email" value= ""><BR><BR>
Ano:<BR><INPUT type="int" name="ano" value= ""><BR><BR>
Site:<BR><INPUT type="text" name="site" value= ""><BR><BR>
Facebook:<BR><INPUT type="text" name="face" value= ""><BR><BR>
Imagem:<BR><INPUT type="text" name="imagem" value= ""><BR><BR>
Telefone:<BR><INPUT type="text" name="tel" value= ""><BR><BR>
Tipo:<BR><INPUT type="text" name="tipo" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
<input type="hidden" name="GEDO" value="<%=request.getParameter("GEDO")%>">
    <%
    }
}
if (request.getParameter("site")!= null) ge.setSite(request.getParameter("site"));
if (request.getParameter("face")!= null) ge.setFace(request.getParameter("face"));
if (request.getParameter("imagem")!= null) ge.setImagem(request.getParameter("imagem"));
if (request.getParameter("tel")!= null) ge.setTel(request.getParameter("tel"));
if (request.getParameter("tipo")!= null) ge.setTipo(request.getParameter("tipo"));

}

boolean update = GEtr.atualizar(ge);
if (update){%> Mudanças efetuadas com sucesso!<%}
    else {%> Erro ao efeitar mudanças! <%}

 %>
</center>
</body>
</html>

