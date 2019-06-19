<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>
<%@page import="Control.CarrinhoDAO"%>
<%@page import="Model.Carrinho"%>
<%@page import="Model.Usuario"%>
<%
    if (session.getAttribute("logado") == null) {
        response.sendRedirect("login.jsp");
    }

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
        <title>JSP Page</title>
        <jsp:include page="./Base/head.jsp"/>
    </head>
    <body class="homeimg">
        <jsp:include page="./Base/navBar.jsp"/>
        %>
        <main>

            <div class="row" style="width: 80vw; margin-left: auto; margin-right: auto;">
                <form action="./VendaControle?action=vender" method="POST" class="col s12 card">

                    <%                        ProdutoDAO pdao = new ProdutoDAO();
                        CarrinhoDAO cdao = new CarrinhoDAO();
                        List<Carrinho> lc = cdao.selectCarrinho(((Usuario) session.getAttribute("logado")).getId_usuario());
                        double valortotal = 0;
                        for (Carrinho c : lc) {
                            Produto p = pdao.selectId(c.getId_produto());
                            valortotal = valortotal + p.getValor();
                    %>
                    <div class="row ">
                        <div class="card col s3 offset-s1">
                            <div class="card-image">
                                <img src="./Imagens/<%= new FotoDAO().selectPIdProdutO(p.getId_produto())%>">
                            </div>
                            <div class="card-content">
                                <span class="card-title bold"><%= p.getNome()%></span>
                                <p><%= p.getDescricao()%></p>
                                <p>R$<%= p.getValor()%></p>
                                <p>Estoque: <%= p.getQuantidade()%></p>
                            </div>
                        </div>
                        <div class="col s6 offset-s1">
                            <div class="row center">
                                <input type="text" name="id_produto" value="<%= p.getId_produto()%>" hidden="true"/>

                                <input type="text" name="id_carrinho" value="<%= c.getId_carrinho()%>" hidden="true"/>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="number" class="quantia" name="quantia" value="<%= c.getQuantidade()%>" min="1" max="<%= p.getQuantidade()%>"/>
                                        <input type="number" class="valor" name="individual" value="<%= p.getValor()%>" hidden="true"/>
                                        <label>Quantidade:</label>
                                    </div>
                                </div>
                                <a class="btn red darken-2" href="CarrinhoControle?action=remover&id_carrinho=<%= c.getId_carrinho()%>">Remover</a>

                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="input-field">
                        <input type="text" name="valor" id="total" value="<%= valortotal%>" readonly="true"/>
                        <label>Valor Total da compra:</label>
                    </div>
                    <div class="row center">
                        <a class="btn red darken-2" href="index.jsp">Cancelar</a>
                        <input type="submit" class="btn black" value="Comprar"/>
                    </div>
                </form>
                <script>
                    $("#total").val(0);
                    $(".quantia").each(function () {
                        var valor = $(this).next($(".valor")).val();
                        var quantia = $(this).val();
                        valor = valor * quantia;
                        novo = parseFloat($("#total").val()) + parseFloat(valor);
                        novo = parseFloat(novo);
                        $("#total").val(novo);
                    });
                    $('.quantia').change(function () {
                        $("#total").val(0);
                        $(".quantia").each(function () {
                            var valor = $(this).next($(".valor")).val();
                            var quantia = $(this).val();
                            valor = valor * quantia;
                            novo = parseFloat($("#total").val()) + parseFloat(valor);
                            novo = parseFloat(novo);
                            $("#total").val(novo);
                        });
                    });
                </script>
            </div>
        </main>


    </body>
</html>
