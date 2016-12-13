<%-- 
    Document   : body_ExibirSeguidores
    Created on : 13/12/2016, 14:31:24
    Author     : Alexandre
--%>

<%@page import= "java.util.*"%>
<%@page import= "data.UsuarioDO"%>
<%@page import= "transacoes.Usuario"%>
<%@page import= "transacoes.Seguindo"%>
<%@page import= "data.SeguindoDO"%>
<%@page import= "data.EventoDO"%>
<%@page import= "transacoes.Evento"%>

<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <BR><BR>
<%
Evento eventotn = new Evento();
Seguindo  seguindotn = new Seguindo();
Usuario usuariotn = new Usuario();

if (request.getParameter("eve") != null ){
    int EVEid = Integer.parseInt(request.getParameter("eve"));
    EventoDO evento = new EventoDO();
    List<SeguindoDO> seguindo = seguindotn.pesquisarPorEVEid(EVEid);
    List<UsuarioDO> usuarios = new ArrayList<UsuarioDO>();
    evento = eventotn.buscar(EVEid);
    int USUid = 0;
    %>
        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                <th>Usuários seguindo <%=evento.getNome()%></th>
    
    <%
    for (int i = 0; i < seguindo.size(); i++){
         USUid = seguindo.get(i).getUsuId();
         usuarios.add(usuariotn.buscarPorID(USUid)); 
         %>
            <tr>
                <td><center><%=usuarios.get(i).getNome()%></center></td>
            </tr>
         <%
    }
    %>
        </table>
    </center>
    <%
}
else{
    %>Houve um problema!<%
    pageContext.forward("index.jsp");
}
%>    
        
        
    </body>
</html>
