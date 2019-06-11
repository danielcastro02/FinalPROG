<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>
<%
    if(session.getAttribute("logado")== null){
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

                <%
                    ProdutoDAO pdao = new ProdutoDAO();
                    Produto p = pdao.selectId(Integer.parseInt(request.getParameter("id_produto")));
                    if (p != null) {
                %>
                <div class="col s12">
                    <div class="row card">
                        <div class="card col s3 offset-s1">
                            <div class="card-image">
                                <img src="./Imagens/<%= new FotoDAO().selectPIdProdutO(p.getId_produto())%>">
                            </div>
                            <div class="card-content">
                                <span class="card-title bold"><%= p.getNome()%></span>
                                <p><%= p.getDescricao()%></p>
                                <p>R$<%= p.getValor()%></p>
                            </div>
                        </div>
                        <div class="col s8">
                            <div class="row center">
                                <h4>Confirme a compra:</h4>
                                <form action="./VendaControle?action=vender" method="POST" class="col s12">
                                    <input type="text" name="id_produto" value="<%= request.getParameter("id_produto")%>" hidden="true"/>
                                    <input type="text" name="valor" value="<%= p.getValor() %>" hidden="true" id="valor"/>
                                    <div class="row">
                                    <div class="input-field col s12">
                                        <input type="number" id="quantia" name="quantia" value="1"/>
                                        <label>Quantidade:</label>
                                    </div>
                                    </div>
                                    <a class="btn red darken-2" href="index.jsp">Cancelar</a>
                                    <input type="submit" class="btn black" value="Comprar"/>
                                </form>
                                    
                                    <h4 id="total">Total: R$ <%= p.getValor() %></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </main>

        <script>
            $('#quantia').change(function () {
                var valor = <%= p.getValor() %>;
                var quantia = $(this).val();
                var total = valor*quantia;
                $("#total").text("Total: R$"+total);
                $("#valor").val(total);
            });
        </script>
    </body>
</html>
