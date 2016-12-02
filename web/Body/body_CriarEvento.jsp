<%-- 
    Document   : body_CriarEvento
    Created on : 02/12/2016, 17:36:54
    Author     : fernandohitoshiwatanabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR =#EAD1A4>
       <h1><center>Criar Evento<center></h1>
<BR>
<center>
  <FORM action="http://www.google.com.br/formtest" enctype="multipart/form-data" method="post">
    Nome do Evento:<BR>
    <INPUT type="text" name="EVEnome" value="Digite aqui o nome do seu evento"><BR><BR>
    Descrição:<BR>
    <INPUT type="text" name="EVEdescricao" value="Digite aqui uma breve descrição do seu evento"><BR><BR>
    Tipo:<BR>
    <INPUT type="text" name="EVEtipo" value="Digite o tpo do seu evento"><BR><BR>
    Horário de início:<BR>
    <INPUT type="text" name="EVEhorario_de_inicio" value="Digite aqui o horário de início do seu evento"><BR><BR>
    Horário de término:<BR>
    <INPUT type="text" name="EVEhorario_de_termino" value="Digite aqui o horário de término do seu evento"><BR><BR>
    Data:<BR>
    <INPUT type="text" name="EVEdata" value="Digite a data do seu evento"><BR><BR>
    Macro evento:<BR>
    <INPUT type="text" name="EVEmacro_evento" value="Se houver digite a qual o macro evento o seu evento pertence"><BR><BR>
    Imagens:<BR>
    <INPUT type="file" name="EVEpasta_de_imagens" id="fileChooser "><BR><BR>
    <input type="submit" value="Upload">
    <INPUT type="submit" name="submit" value="Submit">
    <INPUT type="reset" name="reset" value="Reset">
  </FORM>
<BR><BR><a href="../EsqueceuSenha.jsp" target=" _top">Esqueceu sua senha?</a>
</center>
    </body>
</html>
