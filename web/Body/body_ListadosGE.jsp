<%@page import="java.util.List"%>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%
GE getn = new GE();
%>
<html>
    <body BGCOLOR = #f2f2f2>
        <font face="verdana">
        <h1> <center>Grupos de Extensão </center></h1>

        <p>
            A imagem deve ser a mesma imagem do grupo quando este se cadastra no sistema. 
            Para não deixar a tabela feia, talvez seja bom verificar no programa em java se a imagem é 
            menor ou igual a a um tamanho (eu usei 120X150 pixels) ou mesmo pedir pro usuário fazer isso.
        </p>

        <center>
            <table align="center" border=1 cellpadding=10 width=1000>
                <th>Imagem </th>Grupo de extensão
                <%   
                    List<GEDO> ges = getn.buscarTodos();
                    for(int i = 0; i < ges.size(); i++){
                       GEDO ge = ges.get(i);
                %>    
                <tr>
                <td width=10% height=150 ><center><iframe src="../PastadeImagens/GrupodeExtensao1/Grupodeextensao1-imagem1.PNG" 
                                                          scrolling= no width=120 height=150 ></iframe></center>
                          <td><center><a href="GE.jsp?GE=<%= ge.getNome()%>"><%= ge.getNome() %></a><center>
                </tr>

                <%
                }
                %>
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
                <FORM action="Cadastro_GE.jsp" method="post">
                <INPUT type="submit" name="submit3" value="Cadastrar"> 
                </form>
            <%    
            }else{ //HOME DESLOGADO

            %>
                <BR>
                Você precisar Logar antes
                <FORM action="LoginOut.jsp" method="post">
                <INPUT type="submit" name="submit2" value="Logar">
                </form>
            <%    
            }
            %>
        </center>
    </body>
</html>
