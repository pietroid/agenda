<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>

<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1> <center>Grupos de Extens�o </center></h1>

        <p>
            A imagem deve ser a mesma imagem do grupo quando este se cadastra no sistema. 
            Para n�o deixar a tabela feia, talvez seja bom verificar no programa em java se a imagem � 
            menor ou igual a a um tamanho (eu usei 120X150 pixels) ou mesmo pedir pro usu�rio fazer isso.
        </p>
<%
GE getn = new GE();
%>
        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                <th>Imagem </th>
                <th>Grupo de extens�o</th>
                <%   
                    List<GEDO> ges = getn.buscarTodos();
                    for(int i = 0; i < ges.size(); i++){
                       GEDO ge = ges.get(i);
                       if(ge.getAutorizado() == 1) {
                           String imagem = "/agenda/PastadeImagens/padrao/logo.PNG";
                           if (ge.getImagem() != null){
                               imagem = "/agenda/PastadeImagens/" + ge.getImagem();
                           }
                %>     
                <tr>
                    <td width=10% height=150 ><center><iframe src=<%= imagem %> scrolling= no width=120 height=150 ></iframe></center>
                    <td><center><a href="GE.jsp?GE=<%= ge.getId()%>"><%= ge.getNome() %></a></center>
                </tr>

                <%
                    }
                }
                %>
            </table>
        </center>
        <BR>
        <BR>
        <center>
            Deseja cadastrar um novo grupo de extens�o? 
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
                Voc� precisar Logar antes
                <FORM action="LoginOut.jsp" method="post">
                <INPUT type="submit" name="submit2" value="Logar">
                </form>
            <%    
            }
            %>
        </center>
    </body>
</html>
