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

            <script>
                $(".nome").change(function () {
                    var esse = $(this);
                    alert("nome="+esse.val()+"&id_produto="+esse.next($(".idproduto")).val());

                    $.ajax({
                        url: "./ProdutoControle?action=updateNome",
                        data: "nome="+esse.val()+"&id_produto="+esse.next($(".idproduto")).val() ,
                        type: 'post',
                        success: function (data) {
                            if(data == 'true'){
                                
                            }else{
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".descricao").change(function () {
                    var esse = $(this);
                    $.ajax({
                        url: "./ProdutoControle?action=updateDescricao",
                        data: "descricao="+esse.val()+"&id_produto="+esse.next($(".idproduto")).val() ,
                        type: 'post',
                        success: function (data) {
                            if(data == 'true'){
                                
                            }else{
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".valor").change(function () {
                    var esse = $(this);
                    $.ajax({
                        url: "./ProdutoControle?action=updateValor",
                        data: "valor="+esse.val()+"&id_produto="+esse.next($(".idproduto")).val() ,
                        type: 'post',
                        success: function (data) {
                            if(data == 'true'){
                                
                            }else{
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });
                $(".quantia").change(function () {
                    var esse = $(this);
                    $.ajax({
                        url: "./ProdutoControle?action=updateQuantia",
                        data: "quantia="+esse.val()+"&id_produto="+esse.next($(".idproduto")).val() ,
                        type: 'post',
                        success: function (data) {
                            if(data == 'true'){
                                
                            }else{
                                alert('Algo deu errado, recarregue a pagina e tente novamente!')
                            }
                        }
                    });
                });

            </script>

        </main>
    </body>
</html>
