<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="transacoes.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page import="data.UsuarioDO"%>
<html>
<body BGCOLOR = #f2f2f2>
<font face="verdana">
<h1><center>Cadastro<center></h1>
<BR>
<center>
  <%UsuarioDO usuario1=new UsuarioDO();
            
      if(request.getParameter("submit")==null){%>
  
  <FORM action="Cadastro.jsp" method="post" id="usrform">
      Username <br>
    <input type="text" name="username"/><br><br>
    Senha <br>
    <input type="password" name="senha"/><br><br>
    Repetir senha <br>
    <input type="password" name="senha_rep"/><br><br>
    Nome Completo <br>
    <input type="text" name="nome"/><br><br>
    E-mail <br>
    <input type="email" name="email"/><br><br>
    Curso atual <br>
    <input type="text" name="curso"/><br><br>
    Ano de ingresso <br>
    <input type="text" name="ano"/><br><br>
    Pergunta de segurança <br>
    <input type="text" name="pergunta"/><br><br>
    Resposta <br>
    <input type="text" name="resposta"/><br><br>
    Breve descrição:
 </FORM>
 <textarea rows="4" cols="50" name="bio" form="usrform">
 </textarea><br><br>
  <input type="submit" name="submit" value="Cadastrar"  form="usrform"/>
  <% }else if(request.getParameter("submit").equals("Cadastrar")){
        if(request.getParameter("username").equals("") || request.getParameter("senha").equals("") || request.getParameter("senha_rep").equals("") || request.getParameter("email").equals("") || request.getParameter("nome").equals("")|| request.getParameter("pergunta").equals("")|| request.getParameter("resposta").equals("")){
        %>
  <FORM action="Cadastro.jsp" method="post" id="usrform">
      Username <br>
      <input type="text" name="username" value="<%=request.getParameter("username")%>"><%if(request.getParameter("username").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
    Senha <br>
    <input type="password" name="senha" value="<%=request.getParameter("senha")%>"><%if(request.getParameter("senha").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
    Repetir senha <br>
    <input type="password" name="senha_rep" value="<%=request.getParameter("senha_rep")%>"><%if(request.getParameter("senha_rep").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
    Nome Completo <br>
    <input type="text" name="nome" value="<%=request.getParameter("nome")%>"><%if(request.getParameter("nome").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
    E-mail <br>
    <input type="email" name="email" value="<%=request.getParameter("email")%>"><%if(request.getParameter("email").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
    Curso atual <br>
    <input type="text" name="curso" value="<%=request.getParameter("curso")%>"/><br><br>
     Ano de ingresso <br>
     <input type="text" name="ano" value="<%=request.getParameter("ano")%>"/><br><br>
    Pergunta de segurança <br>
     <input type="text" name="pergunta" value="<%=request.getParameter("pergunta")%>"><%if(request.getParameter("pergunta").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
     Resposta <br>
      <input type="text" name="resposta" value="<%=request.getParameter("resposta")%>"><%if(request.getParameter("resposta").equals("")){%><b style="color:red">*</b><%}%></input>  <br><br>
      Breve descrição:
 </FORM>
    <textarea rows="4" cols="50" name="bio" form="usrform"><%=request.getParameter("bio")%></textarea><br><br>
  <input type="submit" name="submit" value="Cadastrar"  form="usrform"/>
  <%
      
        }else if(!request.getParameter("senha").equals(request.getParameter("senha_rep"))){
            %>
            <b style="color:red">As senhas não são iguais</b> <br><br>
  <FORM action="Cadastro.jsp" method="post" id="usrform">
      Username <br>
      <input type="text" name="username" value="<%=request.getParameter("username")%>"><br><br>
    Senha <br>
    <input type="password" name="senha" value="<%=request.getParameter("senha")%>"><br><br>
    Repetir senha <br>
    <input type="password" name="senha_rep" value="<%=request.getParameter("senha_rep")%>"><br><br>
    Nome Completo <br>
    <input type="text" name="nome" value="<%=request.getParameter("nome")%>">  <br><br>
    E-mail <br>
    <input type="email" name="email" value="<%=request.getParameter("email")%>"><br><br>
    Curso atual <br>
    <input type="text" name="curso" value="<%=request.getParameter("curso")%>"/><br><br>
     Ano de ingresso <br>
     <input type="text" name="ano" value="<%=request.getParameter("ano")%>"/><br><br>
    Pergunta de segurança <br>
     <input type="text" name="pergunta" value="<%=request.getParameter("pergunta")%>"><br><br>
     Resposta <br>
      <input type="text" name="resposta" value="<%=request.getParameter("resposta")%>"><br><br>
      Breve descrição:
 </FORM>
    <textarea rows="4" cols="50" name="bio" form="usrform"><%=request.getParameter("bio")%></textarea><br><br>
  <input type="submit" name="submit" value="Cadastrar"  form="usrform"/>
  <%
        }else{
            UsuarioDO usuario=new UsuarioDO();
            usuario.setUsername(request.getParameter("username"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setCurso(request.getParameter("curso"));
            if(!request.getParameter("ano").equals("")){ 
                Date dt=Date.valueOf(request.getParameter("ano")+"-01-01");
                usuario.setIngresso(dt);
            }
            usuario.setPergunta(request.getParameter("pergunta"));
            usuario.setResposta(request.getParameter("resposta"));
            usuario.setBio(request.getParameter("bio"));
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.now();
            usuario.setData(Date.valueOf(dtf.format(localDate)));
            Usuario usdat=new Usuario();
            if(usdat.incluir(usuario)){
                %> <font face="verdana">
<h2><center>Cadastro bem sucedido! id=<%=usuario.getId()%><center></h2> 
            <BR><a href="LoginOut.jsp" target="_top">Fazer login</a><%
            }
        }
}
  %>
</center>
</body>
</html>
