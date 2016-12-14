<%-- 
    Document   : CriarEvento
    Created on : 05/12/2016, 19:15:54
    Author     : Marcus;
--%>

<%@page import="transacoes.Acontece"%>
<%@page import="data.AconteceDO"%>
<%@page import="transacoes.PontoDeInteresse"%>
<%@page import="data.PontoDeInteresseData"%>
<%@page import="data.PontoDeInteresseDO"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ page import="transacoes.Evento" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.Pertence" %>
<%@ page import="data.PertenceDO" %>
<%@ page import="transacoes.GE" %>
<%@ page import="data.GEDO" %>
<%@ page import="transacoes.Realiza" %>
<%@ page import="data.RealizaDO" %>
<%@ page import="transacoes.Membro" %>
<%@ page import="data.MembroDO" %>
<%@ page import="transacoes.Usuario" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body BGCOLOR = #f2f2f2>
    <font face="verdana">
    <h1><center>Criar Evento<center></h1>
    <BR>
    <%
        UsuarioDO usuario=null;
        if (session.getAttribute("Usuario") != null){
            usuario = (UsuarioDO) session.getAttribute("Usuario");
        }
        if (usuario != null && request.getParameter("GE")!=null){
            Realiza realizatn = new Realiza();
            Membro membrotn = new Membro();
            Usuario usuariotn = new Usuario();
            GE getn = new GE();
            GEDO ge = getn.buscar(Integer.parseInt(request.getParameter("GE")));
            boolean isadm = membrotn.isADM(ge.getId(), usuario.getId());
            if (isadm){
                if (request.getParameter("submit1") == null && request.getParameter("submit2") == null){
    %>
                    <center>
                    <form action = "CriarEvento.jsp?GE=<%=ge.getId()%>" method = "post">
                        Selecione se o evento é macro ou micro: <BR><BR>
                        <input type="radio" name="Eve" value="macro" checked> Macro<br>
                        <input type="radio" name="Eve" value="micro"> Micro<br>
                        <INPUT type="submit" name="submit1" value= "Ok"><BR><BR>
                    </form>
                    </center>
    <% 
                }else
                if (request.getParameter("submit2") != null){
                    String action = request.getParameter("Eve");
                    boolean campospreenchidos = true;
                    boolean ok = false;
                    Evento eventotn = new Evento();
                    EventoDO evento = new EventoDO();
                    RealizaDO realiza = new RealizaDO();
                    Pertence pertencetn = new Pertence();
                    PertenceDO pertence = new PertenceDO();
                    AconteceDO acontece=new AconteceDO();
                    Acontece acontecetn=new Acontece();
                    if (request.getParameter("submit2").equals("Criar micro")){
                        if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEdescricao").equals("")) &&
                            request.getParameter("EVEtipo") != null && !(request.getParameter("EVEtipo").equals("")) &&
                            request.getParameter("EVEhoraI") != null && !(request.getParameter("EVEhoraI").equals("")) &&
                            request.getParameter("EVEminI") != null && !(request.getParameter("EVEminI").equals("")) &&
                            request.getParameter("EVEhoraT") != null && !(request.getParameter("EVEhoraT").equals("")) &&
                            request.getParameter("EVEminT") != null && !(request.getParameter("EVEminT").equals("")) &&
                            request.getParameter("EVEdataD") != null && !(request.getParameter("EVEdataD").equals("")) &&
                            request.getParameter("EVEdataM") != null && !(request.getParameter("EVEdataM").equals("")) &&
                            request.getParameter("EVEdataY") != null && !(request.getParameter("EVEdataY").equals("")) &&
                            request.getParameter("EVEmacro_evento") != null && !(request.getParameter("EVEmacro_evento").equals("")))
                            {
                                evento.setNome(request.getParameter("EVEnome"));
                                evento.setDescricao(request.getParameter("EVEdescricao"));
                                evento.setTipo(request.getParameter("EVEtipo"));
                                evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                                evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                                evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataD"))));
                                evento.setMacroEvento(false);
                                evento.setLink(request.getParameter("EVElink"));
                                ok=eventotn.incluir(evento);
                                int idEv=evento.getId();
                                if (ok == true){ 
                                    acontece.setEVEid(idEv);
                                    acontece.setPOI_id(Integer.parseInt(request.getParameter("EVElocal")));
                                    acontecetn.incluir(acontece);
                                    if (ge != null){
                                        realiza.setEVEid(idEv);
                                        realiza.setGEid(ge.getId());
                                        boolean realizaok = realizatn.incluir(realiza);
                                    }
                                    if (request.getParameter("hasMacro")!=null){
                                        pertence.setMicroId(idEv);
                                        pertence.setMacroId(Integer.parseInt(request.getParameter("EVEmacro_evento")));
                                        boolean pertenceok = pertencetn.incluir(pertence);
                                    }
%><p>Evento criado com sucesso!</p><BR><a href="Evento.jsp?evento=<%=idEv%>">Página do evento</a><%
                                }
                            }else{
                                PontoDeInteresse tpoi=new PontoDeInteresse();
                                List<PontoDeInteresseDO> listaPOI=tpoi.ListarPOI();
                                Evento tev=new Evento();
                                List<EventoDO> listaMEventos=tev.listarMacro();
                        
    %>
                        <b style="color:red">Preencha os campos corretamente!</b>
                        <div align = "left|justify">
                            <FORM action = "CriarEvento.jsp?GE=<%=ge.getId()%>" method = "post">
                                <center>
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
                                <INPUT type="checkbox" name="hasMacro" value="sim"> Tem macro evento </INPUT><BR>
                                Macro evento:
                                <select name="EVEmacro_evento">
                                        <%if(listaMEventos!=null && !listaMEventos.isEmpty()){
                                            for(EventoDO ev : listaMEventos){
                                                %><option value="<%=ev.getId()%>"><%=ev.getNome()%></option><%
                                            }
                                        }%>
                                </select><BR>
                                Local:
                                <select name="EVElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select>
                                <a href="Cadastro_POI.jsp">Cadastro de local...</a><BR><BR>
                                 Link de inscrição para evento, se houver (google forms, site, etc):
                                <INPUT type="text" name="EVElink" maxlength = "100"><BR>
                                <button name="submit2" value="Criar micro">Criar evento</button><BR><BR>
                                </center>
                            </FORM>
                            <BR><BR>
                        </div> <%
                            }
                    }else 
                    if (request.getParameter("submit2").equals("Criar macro")){
                        if (request.getParameter("EVEnome") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEdescricao") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEtipo") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEhoraI") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEminI") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEhoraT") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEminT") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEdataD") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEdataM") != null && !(request.getParameter("EVEnome").equals("")) &&
                            request.getParameter("EVEdataY") != null && !(request.getParameter("EVEnome").equals("")))
                            {
                                evento.setNome(request.getParameter("EVEnome"));
                                evento.setDescricao(request.getParameter("EVEdescricao"));
                                evento.setTipo(request.getParameter("EVEtipo"));
                                evento.setHoraInicial(new Time(Integer.valueOf(request.getParameter("EVEhoraI")), Integer.valueOf(request.getParameter("EVEminI")), 0));
                                evento.setHoraFinal(new Time(Integer.valueOf(request.getParameter("EVEhoraT")), Integer.valueOf(request.getParameter("EVEminT")), 0));
                                evento.setData(new Date(Integer.valueOf(request.getParameter("EVEdataY")) - 1900, Integer.valueOf(request.getParameter("EVEdataM")) - 1, Integer.valueOf(request.getParameter("EVEdataD"))));
                                evento.setMacroEvento(true);
                                evento.setLink(request.getParameter("EVElink"));
                                ok = eventotn.incluir(evento);
                                int idEv=evento.getId();
                                if (ok == true){
                                    acontece.setEVEid(idEv);
                                    acontece.setPOI_id(Integer.parseInt(request.getParameter("EVElocal")));
                                    acontecetn.incluir(acontece);
                                    if (ge != null){
                                        realiza.setEVEid(idEv);
                                        realiza.setGEid(ge.getId());
                                        boolean realizaok = realizatn.incluir(realiza);
                                    }
                                    %><p>Evento criado com sucesso!</p><BR><a href="Evento.jsp?evento=<%=idEv%>">Página do evento</a><%
                                }
                        }else{
                            PontoDeInteresse tpoi=new PontoDeInteresse();
                            List<PontoDeInteresseDO> listaPOI=tpoi.ListarPOI();%>
                            
                        <div align = "left|justify">
                            <FORM action = "CriarEvento.jsp?GE=<%=ge.getId()%>" method = "post">
                                <center>
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
                                <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR><BR>
                                Local:
                                <select name="EVElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select>
                                <BR>
                                Link de inscrição para evento, se houver (google forms, site, etc):
                                <INPUT type="text" name="EVElink" maxlength = "100"><BR>
                                <button name="submit2" value="Criar macro">Criar evento</button><BR><BR>
                                </center>
                            </FORM>
                            <BR><BR>
                        </div> <%
                        }
                    }
                    }else if(request.getParameter("submit1") != null && request.getParameter("submit2") == null){
                    PontoDeInteresse tpoi=new PontoDeInteresse();
                    List<PontoDeInteresseDO> listaPOI=tpoi.ListarPOI();
                    if((request.getParameter("Eve") != null) && request.getParameter("Eve").equals("micro")){
                        Evento tev=new Evento();
                        List<EventoDO> listaMEventos=tev.listarMacro();
                        
    %>
                        <div align = "left|justify">
                            <FORM action = "CriarEvento.jsp?GE=<%=ge.getId()%>" method = "post">
                                <center>
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
                                <INPUT type="checkbox" name="hasMacro" value="sim"> Tem macro evento </INPUT><BR>
                                Macro evento:
                                <select name="EVEmacro_evento">
                                        <%if(listaMEventos!=null && !listaMEventos.isEmpty()){
                                            for(EventoDO ev : listaMEventos){
                                                %><option value="<%=ev.getId()%>"><%=ev.getNome()%></option><%
                                            }
                                        }%>
                                </select><BR>
                                Local:
                                <select name="EVElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select>
                                <BR>
                                Link de inscrição para evento, se houver (google forms, site, etc):
                                <INPUT type="text" name="EVElink" maxlength = "100"><BR>
                                <button name="submit2" value="Criar micro">Criar evento</button><BR><BR>
                                </center>
                            </FORM>
                            <BR><BR>
                        </div>
    
    <%  
                    }else if((request.getParameter("Eve") != null) && request.getParameter("Eve").equals("macro")){
    %>
    
                        <div align = "left|justify">
                            <FORM action = "CriarEvento.jsp?GE=<%=ge.getId()%>" method = "post">
                                <center>
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
                                <INPUT type="number" name="EVEdataD" min = "1" max = "31" size = "2">/<INPUT type="number" name="EVEdataM" min = "1" max = "12" size = "2">/<INPUT type="number" name="EVEdataY" min = "2016" max = "2050" size = "4"><BR><BR>
                                Local:
                                <select name="EVElocal">
                                    <%if(listaPOI!=null && !listaPOI.isEmpty()){
                                            for(PontoDeInteresseDO poi : listaPOI){
                                                %><option value="<%=poi.getId()%>"><%=poi.getNome()%></option><%
                                            }
                                    }%>
                                </select>
                                <BR>
                                Link de inscrição para evento, se houver (google forms, site, etc):
                                <INPUT type="text" name="EVElink" maxlength = "100"><BR>
                                <button name="submit2" value="Criar macro">Criar evento</button><BR><BR>
                                </center>
                            </FORM>
                            <BR><BR>
                        </div>
    <%  
                    }
                }
            }
            else pageContext.forward("index.jsp");
        }
        else pageContext.forward("index.jsp");
    %>
    
    </body>
</html>
