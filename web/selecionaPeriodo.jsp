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
                <div class="col s8 offset-s2 card">
                    <h4 class="center">Selecione o periodo:</h4>
                    <div class="row">
                        <form action="./VendaControle?action=vendasData" method="post">
                            <div class="input-field col s4">
                                <input type="date" name="inicio"/>
                                <label>Data de Início</label>
                            </div> 
                            <div class="input-field col s4">
                                <input type="date" name="fim"/>
                                <label>Data de Fim</label>
                            </div> 
                            <input type="submit" value="Confirmar" class="btn black"/>
                            select id_produto, count(id_produto), sum(quantidade) from produtoVendido as pv left outer join venda as v on v.id_venda = pv.id_venda where data_venda between '2019-06-13' and '2019-06-13' group by id_produto order by 3 desc
                        </form>
                    </div>
                </div>
            </div>


        </main>
    </body>
</html>
