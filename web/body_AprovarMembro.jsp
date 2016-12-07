<%-- 
    Document   : body_AprovarMembro
    Created on : 07/12/2016, 00:16:17
    Author     : Kenji
--%><%@page import="transacoes.Membro"%>
<%@page import="data.MembroDO"%>
<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="data.UsuarioDO"%>




<%if(session.getAttribute("Usuario")!= null)
{
    Membro Lista = new Membro();
    UsuarioDO usuario = (UsuarioDO)session.getAttribute("Usuario");
    int ID_Usuario = usuario.getId();
    List<MembroDO> ListaGEAdm = Lista.AdminedGroups(ID_Usuario);
    for(MembroDO membroAdm:ListaGEAdm){
        List<MembroDO> ListaN_Apv = Lista.buscarPor_N_Apv(membroAdm.getGEid());
        for(MembroDO membroN_Apv:ListaN_Apv){
            UsuarioDO N_Apv = usuario.buscarPorID(membroN_Apv.getUSUid());
            String Nome = N_Apv.getNome();
            %>
            <form action="AprovarMembro.jsp">
                
                <input type="checkbox" name="Aprovado" value="Bike"> <%=Nome%> <br>
                <input type="submit" value="Submit">
            </form>
        }
        
    }
} 
  %>

List<MembroDO> ListaAprova = lista.buscarPorGE