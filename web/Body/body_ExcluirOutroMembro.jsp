<%@page import="java.util.ArrayList"%>
<%@page import="data.MembroDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.GEDO"%>
<%@page import="transacoes.GE"%>
<html>
    
<%@page import="transacoes.Usuario"%>
<%@page import="data.UsuarioDO"%>
<body BGCOLOR = #f2f2f2>

   <center> <h1> <font face="verdana"> Excluir conta de Usuário</font> </h1></center>
<BR>
    
    
    <%    
        UsuarioDO us = (UsuarioDO)session.getAttribute("Usuario");
        Usuario tr = new Usuario();
        
        if(us!=null && us.isSuperUser() && request.getParameter("id")!=null){
            if(request.getParameter("submit")==null){%>
            <center><p>Tem certeza de que deseja excluir este membro?</p>   
            <FORM action="ExcluirOutroMembro.jsp" method="post">
<INPUT type ="submit" name="submit" value= "Sim">   
<INPUT type ="submit" name="submit" value= "Não">
<INPUT type="hidden" name="id" value="<%=request.getParameter("id")%>"></form></center> 
<%
            }else if(request.getParameter("submit").equals("Sim")){
                UsuarioDO exclUs = new UsuarioDO();
                exclUs.setId(Integer.parseInt(request.getParameter("id")));
                Usuario ust=new Usuario();
                Membro mtn=new Membro();
                List<MembroDO> membro=mtn.buscarPorUSUid(exclUs.getId());
                List<MembroDO> adm;
                List<String> grupos=new ArrayList<String>();
                if(!membro.isEmpty()){
                    for(MembroDO m : membro){
                        if(m.getADM()==1){
                            adm=mtn.buscarPorGEidADM(m.getGEid());
                            if(adm.size()==1){
                               GE gtn=new GE();
                               grupos.add(gtn.buscar(m.getGEid()).getNome());
                            }
                        }
                    }
                }
                
                if(ust.excluir(exclUs)){
                    %><center><p>Usuário excluído com sucesso!</p></center> <%
                }else{
                    %><center><p>Usuário não pode ser excluído, pois é o único administrador do(s) grupo(s) <%for(String g:grupos){%><%=g%> ,<%}%> por favor apague antes o(s) grupo(s)</p></center> <%
                }
                
            }else{
                pageContext.forward("index.jsp");
            }
        }else{
            pageContext.forward("index.jsp");
        }
        
        %>

</body>
</html>