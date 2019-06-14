<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.ProdutoVendido"%>
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
                <div class="col s8 offset-s2 card">
                    <h4 class="center">Relatório de produtos mais vendidos de: <%=request.getParameter("inicio")+" até "+ request.getParameter("fim") %></h4>
                    <div class="row">
                        <table>
                            <tr>
                            <td>Nome do produto:</td>
                            <td>Valor:</td>
                            <td>Unidade Vendidas:</td>
                            <td>Lucro Total</td>
                            </tr>
                            <%
                                ProdutoDAO pdao = new ProdutoDAO();
                                List<ProdutoVendido> lpv = (ArrayList) request.getAttribute("ListaVendidos");
                            for(ProdutoVendido pv : lpv){
                                Produto p = pdao.selectId(pv.getId_produto());
                                %>
                                <tr>
                                    <td><%=p.getNome() %></td>
                                    <td>R$ <%=p.getValor()%></td>
                                    <td><%=(int)pv.getQuantidade()%></td>
                                    <td>R$ <%=pv.getQuantidade()*p.getValor() %></td>
                                </tr>
                            <%
                            }
                            %>
                        </table>
                    </div>
                </div>
            </div>


        </main>
    </body>
</html>
