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
   if (request.getParameter("SI") != null || request.getParameter("NO") != null ){
   
       
    if (request.getParameter("SI")== null){
        pageContext.forward("AceitarGE.jsp");
    }else{
        
            GEDO GEexcluir = new GEDO();
            int Solid = Integer.parseInt(request.getParameter("REJ"));
            GE GEtn = new GE();
            GEtn.buscar(Solid);
            GEtn.excluir(GEexcluir);   
        
            pageContext.forward("SolicitacaoExcluidaGE.jsp");   
            
      
    }   
            
} 

%>   
        <h1><center>Tem certeza que deseja rejeitar essa solicitação?</center></h1>   

        <center>
       
        <FORM action="SolicitacaoRejeitada.jsp" method="post">            
        <INPUT type="submit" name="SI" value= "SIM">   
        <INPUT type="submit" name="NO" value= "NÃO">
        <input type="hidden" name="REJ" value="<%=request.getParameter("REJ")%>" >
        </center>
        
        
       
        
    </body>
</html>
