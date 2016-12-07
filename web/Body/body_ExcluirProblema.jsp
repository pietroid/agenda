
<%@ page import="transacoes.Problema"%>
<%@ page import="data.ProblemaDO"%>
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
        
        
        
            ProblemaDO Problemasexcluir = new ProblemaDO();
            int idprob = Integer.parseInt(request.getParameter("EXP"));
            Problema Problemastn = new Problema();
            Problemasexcluir = Problemastn.buscar(idprob);
            Problemastn.excluir(Problemasexcluir);    
        
        
        
        pageContext.forward("ProblemaExcluido.jsp");
    }
}
%>     
        <h1><center>Tem certeza que deseja excluir esse Problema?</center></h1>   
        <BR>
        <center>
       
        <FORM action="ExcluirProblema.jsp" method="post">            
        <INPUT type="submit" name="SIM" value= "SIM">   
        <INPUT type="submit" name="NAO" value= "NÃO">
        <input type="hidden" name="EXP" value="<%=request.getParameter("EXP")%>" >
        </center>
        
        
        
        
        
        
        
        
        
    </body>
</html>
