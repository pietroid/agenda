<%-- 
    Document   : body_AlterarPOI
    Created on : 05/12/2016, 13:58:19
    Author     : Lucas Freitas
--%>

<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1> <center> Alterar Informações do Ponto de Interesse <center> </h1>
<BR>
<%@ page import="transacoes.PontoDeInteresse" %>
<%@ page import="data.PontoDeInteresseDO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.lang.Integer"%>
<%@page import="transacoes.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page import="data.UsuarioDO"%>



<center>
<% 
    if(session.getAttribute("Usuario")!= null){
        UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
        String nome = usuario.getNome();
        if(usuario.isSuperUser()){
            if(request.getParameter("PontoDeInteresse") != null){
                PontoDeInteresseDO poi = new PontoDeInteresseDO();
                PontoDeInteresse PontoDeInteressetr = new PontoDeInteresse();
                poi = PontoDeInteressetr.buscar(Integer.parseInt(request.getParameter("PontoDeInteresse")));
                if(request.getParameter("submit")==null){
%>
<FORM action="AlterarPOI.jsp" method="post">
    Nome do ponto de interesse:<BR>
    <INPUT type="text" name="nome" value="<%=poi.getNome()%>"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="descricao" value="<%=poi.getDescricao()%>"><BR><BR>
    Endereço:<BR>
    <INPUT type="text" name="endereco" value="<%=poi.getEndereco()%>"><BR><BR>
    Link para Google Maps:<BR>
    <INPUT type="text" name="link_para_maps" value="<%=poi.getLink_para_maps()%>"><BR><BR>
    Pasta de Imagens:<BR>
    <INPUT type="text" name="pasta_de_imagens" value="<%=poi.getPasta_de_imagens()%>"><BR><BR>
<INPUT type="submit" name="submit" value= "Salvar Mudancas">   
<input type="hidden" name="PontoDeInteresse" value="<%=request.getParameter("PontoDeInteresse")%>">
</FORM>
<%
                }
                else{
                    poi.setNome(request.getParameter("nome"));
                    poi.setDescricao(request.getParameter("descricao"));
                    poi.setEndereco(request.getParameter("endereco"));
                    poi.setLink_para_maps(request.getParameter("link_para_maps"));
                    poi.setPasta_de_imagens(request.getParameter("pasta_de_imagens"));

                    if(PontoDeInteressetr.atualizar(poi)){ %>Alteração Efetuada Com Sucesso<% }
                    else{%>Alteração não foi bem sucedida<%
                    }
                }
            }
            else {pageContext.forward("ListaPOI.jsp");}    
        }
        else{%>Você não possui acesso a esta página<%}
    } 
    else {%>Você precisar Logar antes
        <FORM action="LoginOut.jsp" method="post">
        <INPUT type="submit" name="submit2" value="Logar">  
        </form> <%
    }%>
</center>
</body>
</html>
