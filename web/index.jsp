<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>

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
        <%
            try {
                if (request.getParameter("msg").equals("ERRO")) {
        %>
        <script>
            alert('Compartamento inesperado do sistema, por favor tente novamente, mesmo que nos não tenhamos mudado nada ainda...');
        </script>
        <%
        } else if (request.getParameter("msg").equals("vendido")) {
        %><script>
            alert('Vendido!!!');
        </script><%
                }
            } catch (Exception e) {

            }
        %>
        <main>
            <div class="row" style="width: 90vw; margin-left: auto; margin-right: auto;">

                <%
                    ProdutoDAO pdao = new ProdutoDAO();
                    List<Produto> ls = pdao.select();
                    int cont = 0;
                    for (Produto p : ls) {
                        if (p.getQuantidade() > 0) {
                            
                %>
                <div class="col s6 m4 l3">
                    <div class="row">
                        <div class="card col s10 offset-s1">
                            <div class="card-image">
                                <img src="./Imagens/<%= new FotoDAO().selectPIdProdutO(p.getId_produto())%>">
                            </div>
                            <div class="card-content">
                                <span class="card-title bold"><%= p.getNome()%></span>
                                <p><%= p.getDescricao()%></p>
                                <p>R$<%= p.getValor()%></p>
                                <p>Estoque: <%= p.getQuantidade()%></p>
                            </div>
                            <div class="card-action">
                                <div class="row">
                                    <a href="./CarrinhoControle?action=addCart&id_produto=<%= p.getId_produto()%>" class="white-text btn black"><i class="material-icons">add_shopping_cart</i></a>
                                    <a href="./compra.jsp?id_produto=<%= p.getId_produto()%>" class="white-text btn black right">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    cont++;
                    if(cont%4 == 0 && cont !=0){
                        out.print("</div><div class='row' style='width: 90vw; margin-left: auto; margin-right: auto;'>");
                    }
                    
                        }
                    }
                %>
            </div>
        </main>
    </body>
</html>
