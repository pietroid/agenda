<%@page import="transacoes.QG"%>
<%@page import="data.QGDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.PontoDeInteresse"%>
<%@page import="data.PontoDeInteresseDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="data.MembroDO"%>
<%@page import="transacoes.Membro"%>
<%@page import="data.GEData"%>
<%@page import="java.lang.Integer"%>
<%@page import="transacoes.GE"%>
<%@page import="data.GEDO"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Cadastro Grupo de Extensão<center></h1>
<BR>
<%                    PontoDeInteresse tpoi=new PontoDeInteresse();
                    List<PontoDeInteresseDO> listaPOI=tpoi.ListarPOI();
                    
                    %>
<% if (session.getAttribute("Usuario")!= null){

%>


    <% 
if (request.getParameter("submit") == null){
    %>
<FORM action="CadastroGE.jsp" method="post">
    
    Nome grupo:<BR>
    <INPUT type="text" name="nome"><BR><BR>
    Tipo/finalidade:<BR>
    <INPUT type="text" name="tipo"><BR><BR>
    Site do grupo:<BR>
    <INPUT type="text" name="site"><BR><BR>
    Ano de criação:<BR>
    <INPUT type="text" name="ano"><BR><BR>
    e-mail para contato (do grupo):<BR>
    <INPUT type="text" name="email"><BR><BR>
    Telefone para contato (do grupo):<BR>
    <INPUT type="text" name="tel"><BR><BR>
    Facebook do grupo:<BR>
    <INPUT type="text" name="face"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="descricao"><BR><BR>
    Local:<BR>
                                <select name="GElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select><BR><BR>
    <INPUT type="submit" name="submit" value="Cadastrar">
    <INPUT type="reset" name="reset" value="Reset">



    <% }%>
    <% 
if (request.getParameter("submit") != null){
    
    GEDO grupo = new GEDO();
    grupo.setNome(request.getParameter("nome"));
    grupo.setTipo(request.getParameter("tipo"));
    grupo.setSite(request.getParameter("site"));
    grupo.setEmail(request.getParameter("email"));
    grupo.setTel(request.getParameter("tel"));
    grupo.setDescricao(request.getParameter("descricao"));
    grupo.setFace(request.getParameter("face"));
    grupo.setImagem("/agenda/PastadeImagens/caneca.png");
    try{
        grupo.setAno(Integer.parseInt(request.getParameter("ano"))); 
           GE novo = new GE();
           novo.incluir(grupo);
           MembroDO membro = new MembroDO ();
           membro.setUSUid(((UsuarioDO)session.getAttribute("Usuario")).getId());
           membro.setGEid(grupo.getId());
           membro.setADM(1);
           membro.setAprovado(1);
           Membro tr = new Membro ();
           tr.incluir (membro);
           int idGE = 0;
           QGDO qgo= new QGDO ();
           qgo.setPOI_id(Integer.parseInt((request.getParameter("GElocal"))));
           qgo.setGEid(grupo.getId());
           QG trqg=new QG();
           trqg.incluir(qgo);


           %>
            Cadastro efetuado com sucesso!  <BR>
            Espere a confirmação de um de nossos administradores.<BR>
            Agora escolha uma imagem para seu grupo! <BR>
                <FORM action="FormularioImagens.jsp" method="post">
                <INPUT type="submit" name="submitIma" value="Escolher Imagem">
                <INPUT type="hidden" name="idGE" value="<%=grupo.getId()%>">
                </form>            
            
        <%
    }catch(Exception e){
    %>
        É necessário digitar um número para o ano <BR> 
        
    <FORM action="CadastroGE.jsp" method="post">           
    Nome grupo:<BR>
    <INPUT type="text" name="nome" value="<%=request.getParameter("nome")%>"><BR><BR>
    Tipo/finalidade:<BR>
    <INPUT type="text" name="tipo" value="<%=request.getParameter("tipo")%>"><BR><BR>
    Site do grupo:<BR>
    <INPUT type="text" name="site" value="<%=request.getParameter("site")%>"><BR><BR>
    Ano de criação:<BR>
    <INPUT type="text" name="ano" ><BR><BR>
    e-mail para contato (do grupo):<BR>
    <INPUT type="text" name="email" value="<%=request.getParameter("email")%>"><BR><BR>
    Telefone para contato (do grupo):<BR>
    <INPUT type="text" name="tel" value="<%=request.getParameter("tel")%>"><BR><BR>
    Facebook do grupo:<BR>
    <INPUT type="text" name="face" value="<%=request.getParameter("face")%>"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="descricao" value="<%=request.getParameter("descricao")%>"><BR><BR>
    Local:<BR>
                                <select name="GElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select><BR><BR>
    <INPUT type="submit" name="submit" value="Cadastrar">
    <INPUT type="reset" name="reset" value="Reset">
    </FORM>  
 <%} }} %>
  <%  if (session.getAttribute("Usuario")== null){
        %>
        
        É Necessário realizar login para cadastrar um grupo
                <FORM action="LoginOut.jsp" method="post">
                <INPUT type="submit" name="submit2" value="Logar">
                </form>
          
        <%  }
    
 %>
</body>
</html>
