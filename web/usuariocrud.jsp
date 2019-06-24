<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>

<%@page import="Control.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%

//    Usuario us = (Usuario) session.getAttribute("logado");
//    if (us != null) {
//        if (us.getAdministrador() != 1) {
//            response.sendRedirect("./index.jsp?msg=acessoNegado");
//        }
//    } else {
//        response.sendRedirect("./index.jsp?msg=acessoNegado");
//
//    }

%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Control.ProdutoDAO" %>
<%@page import="Model.Produto"%>
<%@page import="Model.Foto"%>
<%@page import="Control.FotoDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cartinha Shop - A melhor loja Geek de SVS</title>
        <jsp:include page="./Base/head.jsp"/>
    </head>
    <body class="homeimg">
        <jsp:include page="./Base/navBar.jsp"/>
        <main>
            <div class="row" style="width: 90vw; margin-left: auto; margin-right: auto;">
                <h4 class="card center col s6 offset-s3">Controle de Usuários</h4>
                <table class="card striped">
                    <tr>
                        <td>Nome:</td>
                        <td>Usuario</td>
                        <td>Senha:</td>
                        <td>Telefone:</td>
                        <td>Perfil:</td>
                        <td>Administrador:</td>
                    </tr>
                    <%                        UsuarioDAO udao = new UsuarioDAO();
                        List<Usuario> ls = udao.select();
                        for (Usuario p : ls) {

                    %>
                    <tr>
                        <td><div class="input-field">
                                <input type="text" name="nome" class="nome" value="<%= p.getNome()%>"/>
                                <input type="text" value="<%= p.getId_usuario()%>" class="idusuario" hidden="true"/>
                            </div></td>
                        <td style="max-width: 35vw;"><div class="input-field">
                                <input type="text" class="usuario" name="usuario" value="<%= p.getUsuario()%>"/>
                                <input type="text" value="<%= p.getId_usuario()%>" class="idusuario" hidden="true"/>
                            </div></td>
                        <td>
                            <div class="input-field">
                                <input type="text" name="valor" class="senha" value="<%= p.getSenha()%>"/>
                                <input type="text" value="<%= p.getId_usuario()%>" class="idusuario" hidden="true"/>
                            </div>
                        </td>
                        <td>
                            <div class="input-field">
                                <input type="text" name="quantia" class="telefone" value="<%= p.getTelefone()%>"/>
                                <input type="text" value="<%= p.getId_usuario()%>" class="idusuario" hidden="true"/>
                            </div>
                        </td>
                        <td>
                            <a href="./alteraPerfil.jsp?id_usuario=<%= p.getId_usuario()%>">Editar Foto</a>
                        </td>
                        <td>
                            <a href="./UsuarioControle?action=<%
                                if (p.getAdministrador() == 1) {
                                    out.print("removeadm");
                                } else {
                                    out.print("tornaadm");

                                }
                               %>&id_usuario=<%= p.getId_usuario()%>"><%
                                    if (p.getAdministrador() == 1) {
                                %>Remover ADM<%
                                    } else {
                                %>Tornar ADM<%
                                        }
                                %></a>
                        </td>
                        <td>
                            <a href="UsuarioControle?action=deletar&id_usuario=<%=p.getId_usuario()%>"><i class="material-icons red-text">delete</i></a>
                        </td>
                    <input type="text" value="<%= p.getId_usuario()%>" class="idusuario" hidden="true"/>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>

            <script>
                $(".nome").keyup(function () {
                    var esse = $(this);

                    $.ajax({
                        url: "./UsuarioControle?action=updateNome&nome=" + esse.val() + "&id_usuario=" + esse.next($(".idusuario")).val(),
                        type: 'post',
                        success: function (data) {
                            if (data == 'true') {

                            } else {
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".usuario").keyup(function () {
                    var esse = $(this);

                    $.ajax({
                        url: "./UsuarioControle?action=updateUsuario&usuario=" + esse.val() + "&id_usuario=" + esse.next($(".idusuario")).val(),
                        type: 'post',
                        success: function (data) {
                            if (data == 'true') {

                            } else {
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".senha").keyup(function () {
                    var esse = $(this);

                    $.ajax({
                        url: "./UsuarioControle?action=updateSenha&senha=" + esse.val() + "&id_usuario=" + esse.next($(".idusuario")).val(),
                        type: 'post',
                        success: function (data) {
                            if (data == 'true') {

                            } else {
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".telefone").keyup(function () {
                    var esse = $(this);

                    $.ajax({
                        url: "./UsuarioControle?action=updateTelefone&telefone=" + esse.val() + "&id_usuario=" + esse.next($(".idusuario")).val(),
                        type: 'post',
                        success: function (data) {
                            if (data == 'true') {

                            } else {
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });

            </script>
        </main>
    </body>
</html>
