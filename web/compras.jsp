<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>
<%@page import="Model.ProdutoVendido"%>
<%@page import="Model.Venda"%>
<%@page import="Model.Usuario"%>
<%@page import="Control.ProdutoVendidoDAO"%>
<%@page import="Control.VendaDAO"%>
<%
    Usuario logado = null;
    if (session.getAttribute("logado") == null) {
        response.sendRedirect("login.jsp");
    } else {
        logado = (Usuario) session.getAttribute("logado");
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
        <main>
            <div class="row" style="width: 90vw; margin-left: auto; margin-right: auto;">

                <%
                    VendaDAO vdao = new VendaDAO();
                    ProdutoDAO pdao = new ProdutoDAO();
                    ProdutoVendidoDAO pvdao = new ProdutoVendidoDAO();
                    List<Venda> ls = vdao.selectPUsuario(logado.getId_usuario());
                    
                    for (Venda v : ls) {
                %>
                <ul class="collapsible">
                    <li>
                        <div class="collapsible-header"><%= v.getData_venda().getDay()+"/"+v.getData_venda().getMonth()+"/"+v.getData_venda().getYear()+" -- R$"+v.getValor() %></div>
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
                            %><tr><%= "<td>"+pr.getNome() +"</td><td>"+ pv.getQuantidade() + "</td><td>"+ (pr.getValor()*pv.getQuantidade()) +"</td>"%></tr> </p><%
                                
                            %>
                            </table>
                        </div>
                    </li>
                </ul>
                <%
                    }
                %>
            </div>
        </main>
    </body>
</html>
