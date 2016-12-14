<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>

<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1> <center>Grupos de Extensão </center></h1>

        <%
        GE getn = new GE();
        UsuarioDO user=(UsuarioDO)session.getAttribute("Usuario");
%>
        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                
                <%
                    List<GEDO> ges = getn.buscarTodos();
                    for(int i = 0; i < ges.size(); i++){
                       GEDO ge = ges.get(i);
                        if(ge.getAutorizado() == 1 || (user!=null && user.isSuperUser()) ) {
                            String imagem = "/agenda/PastadeImagens/padrao/logo.png";
                            if (ge.getImagem() != null && !(ge.getImagem().equals(""))){
                               imagem = "/agenda/PastadeImagens/" + ge.getImagem();
                            }
                            
                            if(user!=null && user.isSuperUser()){
                                if(ge.getAutorizado()==0){%>
                                <tr>
                                <td width=10% height=150 ><center><iframe src=<%= imagem %> scrolling= no width=120 height=150 ></iframe></center>
                                <td><center><a style="color:red" href="GE.jsp?GE=<%= ge.getId()%>"><%= ge.getNome() %>(NÃO APROVADO)</a></center>
                                </tr><%
                                }else{%>
                                <tr>
                                <td width=10% height=150 ><center><iframe src=<%= imagem %> scrolling= no width=120 height=150 ></iframe></center>
                                <td><center><a href="GE.jsp?GE=<%= ge.getId()%>"><%= ge.getNome() %></a>  <a style="color:red" href="ExcluirGrupo.jsp?idGEexclusao=<%=ge.getId()%>">Excluir</a></center>
                                </tr>
                               <% }                               
                            }else{%>     
                            <tr>
                                <td width=10% height=150 ><center><iframe src=<%= imagem %> scrolling= no width=120 height=150 ></iframe></center>
                                <td><center><a href="GE.jsp?GE=<%= ge.getId()%>"><%= ge.getNome() %></a></center>
                                </tr>
                            <%
                            }
                        }
                    }%>
            </table>
        </center>
        <BR>
        <BR>
        <center>
            Deseja cadastrar um novo grupo de extensão? 
            <BR> <BR>
            <%
            if(session.getAttribute("Usuario")!= null) //HOME LOGADO
            {

                %>
                <FORM action="CadastroGE.jsp" method="post">
                <INPUT type="submit" name="submit3" value="Cadastrar"> 
                </form>
            <%    
            }else{ //HOME DESLOGADO

            %>
                <BR>
                Você precisar Logar antes
                <BR><BR>
                <FORM action="LoginOut.jsp" method="post">
                <INPUT type="submit" name="submit2" value="Logar">
                </form>
            <%    
            }
            %>
        </center>
    </body>
</html>
