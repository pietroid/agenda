<%-- 
    Document   : body_AprovarMembro
    Created on : 07/12/2016, 00:16:17
    Author     : Kenji
--%>
<%@page import="transacoes.Usuario"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.MembroDO"%>
<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="data.UsuarioDO"%>


<%if(session.getAttribute("Usuario")!= null)
{
    Membro Lista = new Membro();
    Usuario usu_N = new Usuario();
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    int ID_Usuario = usuario.getId();
    List<MembroDO> ListaGEAdm = Lista.AdminedGroups(ID_Usuario);
  
        int idge = Integer.parseInt(request.getParameter("AM"));
        List<MembroDO> ListaN_Apv = Lista.buscarPor_N_Apv(idge);
        
        %><form action="AprovarMembro.jsp" method="get"><%
        for(MembroDO membroN_Apv:ListaN_Apv){
            UsuarioDO N_Apv = usu_N.buscarPorID(membroN_Apv.getUSUid());
            String Nome = N_Apv.getNome();
            
           
            %>
               
                
            <input type="checkbox" name="<%=N_Apv.getId()%>" value="1"> <%=Nome%> <br>
            
        <%}%>
        
    
    
    <input type="hidden" name="AM" value="<%=request.getParameter("AM")%>" >
    <input type="submit" name="submit" value="Submit">
    </form>
    
   <% if(request.getParameter("submit")!=null){
   
        for(MembroDO membros:ListaN_Apv){
            int id = membros.getUSUid();
            String valor = request.getParameter(Integer.toString(id));
            if(valor!=null && valor.equals("1")){
               %>deu certo<BR><%
            }else{%>deu errado<BR><%}
        }
    }
    


}else{%>  
    <h1> <center> P�gina em Branco <center> </h1> 
            
            
<%
}
%>
            
             