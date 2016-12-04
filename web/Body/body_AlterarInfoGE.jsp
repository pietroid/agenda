<%-- 
    Document   : body_AlterarInfoGE
    Created on : Dec 4, 2016, 3:02:30 PM
    Author     : jujux
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informações do Grupo de Extensão <center> </h1>
<BR>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<center>

<FORM action="body_AlterarInfoGE.jsp" method="post">
Descrição:<BR><INPUT type="text" maxlength="140" name="descrição" value= ""> <BR><BR>
E-mail:<BR><INPUT type="text" name="e-mail" value= ""><BR><BR>
Local:<BR><INPUT type="text" name="local" value= ""><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudanças">   
<INPUT type="reset" name="reset" value= "Reset">
</FORM>
</center>
</body>
</html>

