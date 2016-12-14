<%-- 
    Document   : body_EditarEvento
    Created on : 05/12/2016, 19:18:21
    Author     : Marcus;
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="transacoes.PontoDeInteresse"%>
<%@page import="data.PontoDeInteresseDO"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Acontece" %>
<%@ page import="data.AconteceDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar evento</title>
    </head>
    <%
        UsuarioDO usuario = new UsuarioDO();
        if (session.getAttribute("Usuario") != null){
            usuario = (UsuarioDO) session.getAttribute("Usuario");
        }
        if (usuario.getNome() != null){
            Evento eventotn = new Evento();
            Membro membrotn = new Membro();
            Usuario usuariotn = new Usuario();
            PontoDeInteresse tpoi=new PontoDeInteresse();
            List<PontoDeInteresseDO> listaPOI=tpoi.ListarPOI();
            List<EventoDO> listaMEventos = eventotn.listarMacro();
            if (request.getParameter("evento") != null) {
                EventoDO evento = eventotn.buscar(Integer.parseInt(request.getParameter("evento")));
                Realiza realizatn = new Realiza();
                RealizaDO realiza = realizatn.buscarPorEVE(evento.getId());
                boolean isadm = membrotn.isADM(realiza.getGEid(), usuario.getId());
                if (usuario.isSuperUser() == true || isadm == true){
                    boolean updateevento = false;
                    Pertence pertencetn = new Pertence();
                    PertenceDO pertence = new PertenceDO();
                    Acontece acontecetn = new Acontece();
                    AconteceDO acontece = new AconteceDO();
    %>
    <body BGCOLOR = #f2f2f2>
        <center>
            <h1> Edição de evento </h1>
            <BR><BR>
            <h2> Modificar o evento: <%= evento.getNome() %> </h2><BR><BR>
        </center>
    <font face="verdana">
    <%
                    if (request.getParameter("submit1") != null){
                        if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals(""))) evento.setNome(request.getParameter("EVEnome"));
                        if (request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEdescricao").equals(""))) evento.setDescricao(request.getParameter("EVEdescricao"));
                        if (request.getParameter("EVEtipo") != null && !(request.getParameter("EVEtipo").equals(""))) evento.setTipo(request.getParameter("EVEtipo"));
                        if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null && !(request.getParameter("EVEhoraI").equals("")) && !(request.getParameter("EVEminI").equals(""))) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                        if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null && !(request.getParameter("EVEhoraT").equals("")) && !(request.getParameter("EVEminT").equals(""))) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                        if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null && !(request.getParameter("EVEdataD").equals("")) && !(request.getParameter("EVEdataM").equals("")) && !(request.getParameter("EVEdataY").equals(""))) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataM"))));
                        if (request.getParameter("EVElink") != null && !(request.getParameter("EVElink").equals(""))) evento.setLink(request.getParameter("EVElink"));
                        if (request.getParameter("EVEmacro_evento") != null){
                            EventoDO macro2 = eventotn.buscar(Integer.parseInt(request.getParameter("EVEmacro_evento")));
                            if (macro2 != null){
                                pertence = pertencetn.buscar(evento.getId());
                                pertence.setMacroId(macro2.getId());
                                boolean updatepertence = pertencetn.atualizar(pertence);
                            }
                            if (request.getParameter("EVElocal") != null){
                                acontece = acontecetn.buscarPorEVEid(evento.getId());
                                acontece.setPOI_id(Integer.parseInt(request.getParameter("EVElocal")));
                                acontecetn.atualizar(acontece);
                            }
                        }
                        updateevento = eventotn.atualizar(evento);
                    }
                    if (request.getParameter("submit2") != null){
                        if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals(""))) evento.setNome(request.getParameter("EVEnome"));
                        if (request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEdescricao").equals(""))) evento.setDescricao(request.getParameter("EVEdescricao"));
                        if (request.getParameter("EVEtipo") != null && !(request.getParameter("EVEtipo").equals(""))) evento.setTipo(request.getParameter("EVEtipo"));
                        if (request.getParameter("EVEhoraI") != null && request.getParameter("EVEminI") != null && !(request.getParameter("EVEhoraI").equals("")) && !(request.getParameter("EVEminI").equals(""))) evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                        if (request.getParameter("EVEhoraT") != null && request.getParameter("EVEminT") != null && !(request.getParameter("EVEhoraT").equals("")) && !(request.getParameter("EVEminT").equals(""))) evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                        if (request.getParameter("EVEdataD") != null && request.getParameter("EVEdataM") != null && request.getParameter("EVEdataY") != null && !(request.getParameter("EVEdataD").equals("")) && !(request.getParameter("EVEdataM").equals("")) && !(request.getParameter("EVEdataY").equals(""))) evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataD"))));
                        if (request.getParameter("EVElink") != null && !(request.getParameter("EVElink").equals(""))) evento.setLink(request.getParameter("EVElink"));
                        if (request.getParameter("EVElocal") != null){
                            acontece = acontecetn.buscarPorEVEid(evento.getId());
                            acontece.setPOI_id(Integer.parseInt(request.getParameter("EVElocal")));
                            acontecetn.atualizar(acontece);
                        }
                        updateevento = eventotn.atualizar(evento);
                    }
                    if (updateevento == true){
                %>

                <center>
                    Evento modificado com sucesso.<BR><BR>
                </center>

                <%
                    }
                    boolean macro = evento.isMacroEvento();
                    if(!macro){
    %>
    <div align = "left|justify">
        <form action = "EditarEvento.jsp?evento=<%= evento.getId() %>" method = "post">
            Nome do Evento:
            <INPUT type="text" name="EVEnome" maxlength = "30"><BR>
            Descrição:
            <INPUT type="text" name="EVEdescricao" maxlength = "140" size = "140"><BR>
            Tipo do evento:
            <INPUT type="text" name="EVEtipo"><BR>
            Horário de início:
            <INPUT type="number" name="EVEhoraI" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminI" min = "0" max = "59" size = "2"><BR>
            Horário de término:
            <INPUT type="number" name="EVEhoraT" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminT" min = "0" max = "59" size = "2"><BR>
            Data (dd/mm/yyyy):
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR>
            Macro evento:
            <select name="EVEmacro_evento">
            <%
                if(listaMEventos!=null && !listaMEventos.isEmpty()){
                    for(EventoDO ev : listaMEventos){
                        %><option value="<%=ev.getId()%>"><%=ev.getNome()%></option><%
                    }
                }
            %>
            </select><BR>
            Local:
            <select name="EVElocal">
            <%
                if(listaPOI!=null && !listaPOI.isEmpty()){
                    for(PontoDeInteresseDO poi : listaPOI){
                        %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                    }
                }
            %>
            </select><BR>
            Link de inscrição para evento, se houver (google forms, site, etc):
            <INPUT type="text" name="EVElink" maxlength = "100"><BR>
            <INPUT type="submit" name="submit1" value="Alterar">
        </FORM>
        <BR><BR>
    </div>
    <% 
                    }
                    if(macro){
    %>
    <div align = "left|justify">
        <form action = "EditarEvento.jsp?evento=<%= evento.getId() %>" method = "post">
            Nome do Evento:
            <INPUT type="text" name="EVEnome" maxlength = "30"> <BR>
            Descrição:
            <INPUT type="text" name="EVEdescricao" maxlength = "140" size = "140"><BR>
            Tipo:
            <INPUT type="text" name="EVEtipo"><BR>
             Horário de início:
            <INPUT type="number" name="EVEhoraI" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminI" min = "0" max = "59" size = "2"><BR>
            Horário de término:
            <INPUT type="number" name="EVEhoraT" min = "0" max = "23" size = "2">:<INPUT type="number" name="EVEminT" min = "0" max = "59" size = "2"><BR>
            Data (dd/mm/yyyy):
            <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR>
            <select name="EVElocal">
                <%
                    if(listaPOI!=null && !listaPOI.isEmpty()){
                        for(PontoDeInteresseDO poi : listaPOI){
                            %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                        }
                    }
                %>
            </select>
            Link de inscrição para evento, se houver (google forms, site, etc):
            <INPUT type="text" name="EVElink" maxlength = "100"><BR>
            <INPUT type="submit" name="submit2" value="Alterar">
        </FORM>
        <BR><BR>
    </div>
    <% 
                    }
                }
                else pageContext.forward("index.jsp");
            }
            else{
            %>
            
            Erro ao buscar o evento.
            
            <%
            }
        }
        else pageContext.forward("index.jsp");
    %>
    </body>
</html>
