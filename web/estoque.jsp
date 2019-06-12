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
                <table class="card striped">
                    <tr>
                        <td>Nome:</td>
                        <td>Descrição:</td>
                        <td>Valor individual:</td>
                        <td>Estoque:</td>
                    </tr>
                    <%
                        ProdutoDAO pdao = new ProdutoDAO();
                        List<Produto> ls = pdao.select();
                        for (Produto p : ls) {

                    %>
                    <tr>
                        <td><div class="input-field">
                                <input type="text" name="nome" class="nome" value="<%= p.getNome()%>"/>
                            </div></td>
                        <td style="max-width: 35vw;"><div class="input-field">
                                <textarea class="materialize-textarea" name="descricao" class="descricao"><%= p.getDescricao()%></textarea>
                            </div></td>
                        <td>
                            <div class="input-field">
                                <span style="width: 15%">R$</span><input style="width: 85%;" type="text" name="valor" class="valor" value="<%= p.getValor()%>"/>
                            </div>
                        </td>
                        <td>
                            <div class="input-field">
                                <input type="number" name="quantia" class="quantia" value="<%= p.getQuantidade()%>"/>
                            </div>
                        </td>
                    <input type="text" value="<%= p.getId_produto()%>" class="idproduto" hidden="true"/>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </main>
    </body>
</html>
