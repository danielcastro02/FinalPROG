<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>

<%@page import="Model.ProdutoVendido"%>
<%@page import="Model.ProdutoVendido"%>
<%@page import="Model.Venda"%>
<%@page import="Model.Venda"%>
<%@page import="Control.ProdutoVendidoDAO"%>
<%@page import="Control.VendaDAO"%>
<%@page import="Control.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
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
                <div class="row">
                    <h4 class="card center col s6 offset-s3">Compras por Usuário</h4>
                </div>
                <div class="row">
                    <ul class="card collapsible">
                        <%
                            UsuarioDAO udao = new UsuarioDAO();
                            List<Usuario> luser = udao.select();

                            for (Usuario user : luser) {


                        %>
                        <li>
                            <div class="collapsible-header"><%= user.getNome()%></div>
                            <div class="collapsible-body">
                                <ul class="collapsible popout ">
                                    <%
                                        VendaDAO vdao = new VendaDAO();
                                        ProdutoDAO pdao = new ProdutoDAO();
                                        ProdutoVendidoDAO pvdao = new ProdutoVendidoDAO();
                                        List<Venda> ls = vdao.selectPUsuario(user.getId_usuario());
                                        if (!ls.isEmpty()) {
                                            for (Venda v : ls) {
                                    %>

                                    <li class="card">
                                        <div class="collapsible-header"><%= v.getData_venda() + " -- R$" + v.getValor()%></div>
                                        <div class="collapsible-body">
                                            <table class="striped">
                                                <tr>
                                                    <td>Produto</td>
                                                    <td>Unidades</td>
                                                    <td>Valor</td>
                                                </tr><%
                                                    List<ProdutoVendido> pvl = pvdao.selectPVenda(v.getId_venda());
                                                    for (ProdutoVendido pv : pvl) {
                                                        Produto pr = pdao.selectId(pv.getId_produto());
                                                %><tr><%= "<td>" + pr.getNome() + "</td><td>" + (int) pv.getQuantidade() + "</td><td>" + (pr.getValor() * pv.getQuantidade()) + "</td>"%></tr> </p><%
                                                    }
                                                %>
                                            </table>
                                        </div>
                                    </li>

                                    <%
                                        }
                                    } else {
                                    %>
                                    <div class="row card center">
                                        <br><br><br><br><br><br><br>
                                        <h5>Você ainda não tem compras aqui</h5>
                                        <br><br><br><br><br><br><br>
                                    </div>
                                    <%
                                        }
                                    %>
                                </ul>

                            </div>
                        </li>
                        <%                        }
                        %>
                    </ul>
                </div>

            </div>

        </main>
    </body>
    <script>
        $(document).ready(function () {
            $('.collapsible').collapsible();
        });

    </script>
</html>
