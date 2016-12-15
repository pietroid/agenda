<%-- 
    Document   : body_SolicitarAdministracao
    Created on : Dec 5, 2016, 5:57:54 PM
    Author     : Diego
--%>
<%@page import="java.util.List"%>

<html>
    
<%@ page import="transacoes.NotificacaoGeral" %>
<%@ page import="data.NotificacaoGeralDO" %>    
<%@ page import="transacoes.Membro" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.MembroDO" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.Vector" %>

<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Solicitar Administração</center></h1>
<BR><BR>
<%  UsuarioDO usersol= (UsuarioDO)session.getAttribute("Usuario");
    int geadmID = Integer.parseInt(request.getParameter("GEid"));
    int IDusersol = usersol.getId();
    
    Membro membAdmtr = new Membro();
    MembroDO membAdm = new MembroDO();
    
    Membro membsoltr = new Membro();
    
    List<MembroDO> listadm = membAdmtr.buscarPorGEidADM(geadmID);
    membAdm=listadm.get(0);  
    
    List<MembroDO> listmemb = membsoltr.buscarPorUSUid(IDusersol); 
    for(MembroDO membro: listmemb){
        if(membro.getGEid()== geadmID){
    
        NotificacaoGeralDO Notsol = new NotificacaoGeralDO();
        NotificacaoGeral Notsoltr = new NotificacaoGeral();
    

    

        Notsol.setUsuId(membAdm.getUSUid());
        Notsol.setClassificacao(4);
        Notsol.setIDassociado(membro.getId());
        Notsol.setMensagem("");
    
        if (Notsoltr.incluir(Notsol)){

            %> <th><center>A sua solicitação foi feita com sucesso!<center></th>  <%

        }else{
            %>Não foi possível enviar sua solicitação.<%

        }



       }

    }


%>

</body>
</html>
