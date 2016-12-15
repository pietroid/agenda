<%-- 
    Document   : body_AprovarMembro
    Created on : 07/12/2016, 00:16:17
    Author     : Kenji
--%>
<%@page import="transacoes.Usuario"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.MembroDO"%>
<%@page import="data.GEDO"%>
<%@page import="java.util.List"%>
<%@page import="data.UsuarioDO"%>




<%
    Membro Lista = new Membro();
    Usuario usu_N = new Usuario();
    UsuarioDO usuario = (UsuarioDO) session.getAttribute("Usuario");
    int ID_Usuario = usuario.getId();
    List<MembroDO> ListaGEAdm = Lista.AdminedGroups(ID_Usuario);
    int idge = Integer.parseInt(request.getParameter("AM"));
    List<MembroDO> ListaN_Apv = Lista.buscarPor_N_Apv(idge);

%><center><h1><font face="verdana"> Solitações de Entrada no GE </font></h1></center><%    
    if (ListaN_Apv != null) {

        if (request.getParameter("submit") != null) {
            Membro Muda = new Membro();
            for (MembroDO membros : ListaN_Apv) {
                int id = membros.getUSUid();
                String valor = request.getParameter(Integer.toString(id));
                if (valor != null && valor.equals("1")) {
                    membros.setAprovado(1);
                    Muda.alterar(membros);
                }
            }
         %>Aprovação feita com sucesso!<%

        } else {


        %>
<form action="AprovarMembro.jsp" method="post"><%        
            for (MembroDO membroN_Apv : ListaN_Apv) {
            UsuarioDO N_Apv = usu_N.buscarPorID(membroN_Apv.getUSUid());
            String Nome = N_Apv.getNome();


    %>


    <input type="checkbox" name="<%=N_Apv.getId()%>" value="1"> <%=Nome%> <br>
    <BR>
    <%}%>
    <input type="hidden" name="AM" value="<%=request.getParameter("AM")%>" >
    <BR>
    <input type="submit" name="submit" value="Submit">

</form>


<%--<script>location.reload(true);</script>--%>

<% }
  } else {%>  
<h1> <center> Não há novas solitações <center> </h1><BR>
            <p> <center> <a href="http:Perfil.jsp">Voltar</a> <center> </p><BR>
                    <%
                        }
                    %>

