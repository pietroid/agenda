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
        pageContext.forward("AceitarGE.jsp");
    }else if(request.getParameter("REJ")==null){
        
            GEDO GEaceitar = new GEDO();
            int GEid2 = Integer.parseInt(request.getParameter("ACE"));
            GE GEtn = new GE();
            GEaceitar = GEtn.buscar(GEid2);
            GEaceitar.setAutorizado(1);
            GEtn.atualizar(GEaceitar);    
        
            pageContext.forward("GEokay.jsp");    
    }else if(request.getParameter("ACE")==null){
            
            GEDO GErejeitar = new GEDO();
            int GEid2 = Integer.parseInt(request.getParameter("REJ"));
            GE GEtn = new GE();
            GErejeitar = GEtn.buscar(GEid2);
            GEtn.excluir(GErejeitar);
            GEtn.atualizar(GErejeitar);    
        
            pageContext.forward("SolicitaçãoExcluidaGE.jsp"); 
    }
            
            
            
}  if(request.getParameter("ACE")!=null){
%>   
        <h1><center>Tem certeza que deseja adicionar esse Grupo de Extensão?</center></h1>   
        <%}else{
    %> <h1><center>Tem certeza que deseja rejeitar essa Solicitação?</center></h1>
        
        <BR>
        <center>
       
        <FORM action="GEAceito.jsp" method="post">            
        <INPUT type="submit" name="SIM" value= "SIM">   
        <INPUT type="submit" name="NAO" value= "NÃO">
        <input type="hidden" name="ACE" value="<%=request.getParameter("ACE")%>" >
        </center>
        
        
       
        
    </body>
</html>
