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

       
    if (request.getParameter("SIM")== null){
        pageContext.forward("AceitarGE.jsp");
    }else{
        
            GEDO GEaceitar = new GEDO();
            int GEid2 = Integer.parseInt(request.getParameter("ACE"));
            GE GEtn = new GE();
            GEaceitar = GEtn.buscar(GEid2);
            GEaceitar.setAutorizado(1);
            GEtn.atualizar(GEaceitar);    
        
            pageContext.forward("GEokay.jsp");   
            
      
    }   
            
} 

%>   
        <h1><center>Tem certeza que deseja adicionar esse Grupo de Extensão?</center></h1>   

        <center>
       
        <FORM action="GEAceito.jsp" method="post">            
        <INPUT type="submit" name="SIM" value= "SIM">   
        <INPUT type="submit" name="NAO" value= "NÃO">
        <input type="hidden" name="ACE" value="<%=request.getParameter("ACE")%>" >
        </center>
        
        
       
        
    </body>
</html>
