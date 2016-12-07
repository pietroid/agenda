<%-- 
    Document   : body_GEAceito
    Created on : 07/12/2016, 11:18:23
    Author     : Alexandre
--%>

<%@ page import="transacoes.GE"%>
<%@ page import="data.GEDO"%>
<%@ page import="java.util.Vector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
       

 <%       
   if (request.getParameter("SIM") != null || request.getParameter("NAO") != null ){
    //UsuarioDO usuario;
   // Usuario tru = new Usuario();
  //  usuario=tru.buscarPorUsername(request.getParameter("login"));
    if (request.getParameter("SIM")== null){
        pageContext.forward("Problemas.jsp");
    }else {
        
        
        
            GEDO GEaceitar = new GEDO();
            int GEid = Integer.parseInt(request.getParameter("EXP"));
            Sol
            GE GEtn = new GE();
            GEaceitar = GEtn.buscar(GEid);
            GEtn.incluir(GEaceitar);    
        
        pageContext.forward("GEokay.jsp");
    }
}
%>     
        <h1><center>Tem certeza que deseja adicionar esse Grupo de Extensão?</center></h1>   
        <BR>
        <center>
       
        <FORM action="GEAceito.jsp" method="post">            
        <INPUT type="submit" name="SIM" value= "SIM">   
        <INPUT type="submit" name="NAO" value= "NÃO">
        <input type="hidden" name="EXP" value="<%=request.getParameter("EXP")%>" >
        </center>
        
        
       
        
    </body>
</html>
