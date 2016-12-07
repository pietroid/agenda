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
        UsuarioDO Lista_Nome = new UsuarioDO();
        for(MembroDO membroN_Apv:ListaN_Apv)
        {
            int ID_N_Apv = ListaN_Apv.getId();
            Lista_Nome = usu_N.buscarPorID(ID_N_Apv);
        }%>
    
    <h2><font size="4" face="verdana"> - Solicitações:</font><h2>
    <table align="cente" border=3    cellpadding = 10 width=1000   >
        <tr>
            <th>GE</th>
            <td>
                <table>
            <%
              for(UsuarioDO membroN_Apv:Lista_Nome){
                  messageApv = membroN_Apv.getNome() ;
            %>
                    <%
                        if (membroN_Apv.getClassificacao()==0){
                    %>
                    <tr>
                        -><%=messageApv %> <a href = "Perfil.jsp?NotId=<%=membroN_Apv.getId()%>&Excluir=1">[X]Aprovar!</a> <br>
                    </tr>
                    <%
                        }
                    }
                    %>
                </table>
                
            </td>
        </tr>
            
            