<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Confirma��o de Exclus�o <center> </h1>
<BR>

<%@ page import="transacoes.GE" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.GEDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.*" %>

<center>

<% 
    UsuarioDO SUser = (UsuarioDO)session.getAttribute("Usuario");
    if (SUser.isSuperUser()){
        if (request.getParameter("submit").equals("Confirmar")){ //
            GEDO GEexcluir = new GEDO(); //(GEDO)session.getAttribute("GEDOclicado");//
            GE GEtn = new GE();
            GEtn.excluir(GEexcluir);
        }
    }
    else { %>
    Voce n�o tem permiss�o para realizar esta opera��o
    <% }
}
%>
<FORM action="body_ExcluirGrupo.jsp" method="post">
Deseja confirmar a exclus�o do Grupo de extens�o?
<INPUT type="submit" name="submit" value= "Confirmar">   
<INPUT type="reset" name="reset" value= "Cancelar">
</FORM>
</center>
</body>
</html>
