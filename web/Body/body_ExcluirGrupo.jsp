<%@page import="java.lang.Integer.parseInt(String)"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Confirmação de Exclusão <center> </h1>
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
        if (request.getParameter("ConfExclusao")!=null){ 
            %>
        O grupo foi excluido!    
            <%
            GEDO GEexcluir = new GEDO();
            int id = Integer.parseInt(request.getParameter("idGEexclusao"));
            GE GEtn = new GE();
            GEtn.buscar(id);
            GEtn.excluir(GEexcluir);
        }
        else{
        %>
            <FORM action="ExcluirGrupo.jsp" method="post">
                Deseja confirmar a exclusão do Grupo de extensão?<br><br>
            <INPUT type="submit" name="ConfExclusao" value= "Confirmar">   
            <INPUT type="hidden" name="idGEexclusao" value="<%=request.getParameter("idGEexclusao")%>">
            </FORM>
        <%
        }
    }
    else { %>
    Voce não tem permissão para realizar esta operação
    <% }
%>

</center>
</body>
</html>
