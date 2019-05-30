<%@page import="Model.Usuario"%>
<%
    Usuario us = (Usuario) session.getAttribute("logado");
    if (us != null) {
        if (us.getAdministrador() != "true") {
            response.sendRedirect("./index.jsp?msg=acessoNegado");
        }
    } else {
        response.sendRedirect("./index.jsp?msg=acessoNegado");

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
        <main>
            <div class="row">
                <div class="col s8 offset-s2 card">
                    <form method="post" action="ProdutoControle?action=cadastro">
                        <div class="row col s10 offset-s2 pull-s1 center">
                            <h4 class="col s8 offset-s2">Informe seus dados!</h4>
                            <div class="input-field col s6">
                                <input type="text" name="nome" class="input-field"/>
                                <label for='nome'>Nome:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="usuario" class="input-field"/>
                                <label for='usuario'>Escolha um nome de usuario:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="telefone" class="input-field"/>
                                <label for='telefone'>Telefone:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="senha1" class="input-field"/>
                                <label for='senha1'>Senha:</label>
                            </div>
                            <div class="input-field col s6">
                                <input type="text" name="senha2" class="input-field"/>
                                <label for='senha2'>Repita a senha:</label>
                            </div>
                        </div>

                        <div class="row center">
                            <a href="./index.jsp" class="btn red darken-2">Voltar</a>

                            <input type="submit" class="btn black" value="Cadastrar"/>

                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>
