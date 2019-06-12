<%@page import="Model.Usuario"%>
<%
    if (session.getAttribute("logado") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="./Base/head.jsp"/>
    </head>
    <body class="homeimg">
        <jsp:include page="./Base/navBar.jsp"/>

        <%
            Usuario us = (Usuario) session.getAttribute("logado");

        %>
        <main>
            <div class="row">
                <div class="col s8 offset-s2 card">
                    <div class="row">
                        <br>
                        <br>
                        <a href="../alterarPerfil.jsp">
                            <div  class="fotoPerfilReal" style='background-image: url("./<%= us.getFoto_perfil() %>");
                                  background-size: cover;
                                  background-position: center;
                                  background-repeat: no-repeat;'>
                                <div class="linkfoto white-text center"><span>Alterar Foto</span></div>            
                            </div>
                        </a>
                    </div>

                    <form method="post" action="UsuarioControle?action=update">
                        <div class="row col s10 offset-s2 pull-s1 center">
                            <h4 class="col s8 offset-s2">Informe seus dados!</h4>
                            <div class="input-field col s6">
                                <input type="text" name="nome" value="<%= us.getNome()%>" class="input-field"/>
                                <label for='nome'>Nome:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="usuario" value="<%= us.getUsuario()%>" class="input-field"/>
                                <label for='usuario'>Escolha um nome de usuario:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="telefone" value="<%= us.getTelefone()%>" class="input-field"/>
                                <label for='telefone'>Telefone:</label>
                            </div>
                        </div>
                        <div class="row center">
                            <a href="./index.jsp" class="btn red darken-2">Voltar</a>

                            <input type="submit" class="btn black" value="Alterar"/>

                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>
