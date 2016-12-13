<%-- 
    Document   : body_Seguindo
    Created on : 07/12/2016, 05:23:15
    Author     : daniel
--%>

<%@page import="data.UsuarioDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Seguir Evento</h1>
        <% 
        if (session.getAttribute("Usuario")!=null) {
            UsuarioDO usuario = new UsuarioDO();
            usuario = (UsuarioDO) session.getAttribute("Usuario");
    </body>
</html>
