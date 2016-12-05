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
    GEDO GE = (GEDO)session.getAttribute("GEDO");
    GE GEtr = new GE();
    
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
</FORM>
<%} else if(request.getParameter("submit")=="Salvar Mudanças" ) { 
 
if (request.getParameter("nome")!= null) GE.setNome(request.getParameter("nome"));
if (request.getParameter("descrição")!= null) GE.setDescricao(request.getParameter("descrição"));
if (request.getParameter("email")!= null) GE.setEmail(request.getParameter("email"));
if (request.getParameter("ano")!= null) GE.setAno(Integer.parseInt(request.getParameter("ano")));
if (request.getParameter("site")!= null) GE.setSite(request.getParameter("site"));
if (request.getParameter("face")!= null) GE.setFace(request.getParameter("face"));
if (request.getParameter("imagem")!= null) GE.setImagem(request.getParameter("imagem"));
if (request.getParameter("tel")!= null) GE.setTel(request.getParameter("tel"));
if (request.getParameter("tipo")!= null) GE.setTipo(request.getParameter("tipo"));

}

boolean update = GEtr.atualizar(GE);
}
 %>
</center>
</body>
</html>

