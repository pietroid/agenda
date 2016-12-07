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
  
    for(MembroDO membroAdm:ListaGEAdm){
        List<MembroDO> ListaN_Apv = Lista.buscarPor_N_Apv(membroAdm.getGEid());
        for(MembroDO membroN_Apv:ListaN_Apv){
            UsuarioDO N_Apv = usu_N.buscarPorID(membroN_Apv.getUSUid());
            //String Nome = N_Apv.getNome();
            %>ID<%=membroN_Apv.getUSUid()%><%
            if(N_Apv==null){
                %>NULO<%
            }else{
                %>SIM<%
            }
            %>  <h1> <center> Página em verde escuro <center> </h1>  <%

            %>
            <%--   <form action="AprovarMembro.jsp">
                
                <input type="checkbox" name=<%=Nome%> value=""> <%=Nome%> <br>
            
       --%> <%}%>
        
    <%}%>
   <%-- <input type="submit" value="Submit">
    </form>
                
    --%>
<%}else{

%>  <h1> <center> Página em Branco <center> </h1>  <%

}



%>