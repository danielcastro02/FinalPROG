<%@page import="Control.CarrinhoDAO"%>
<%@page import="Model.Usuario"%>
<nav  class="black z-depth-1" style="position: fixed; z-index: 9;">
    <div class = "row nav-wrapper">
        <a class="col s4 left-align" tabindex="2" href = "./index.jsp" style = "margin-left: 30px; font-size: 40px">CartinhaShop</a>
<!--        <form class="col s4 hide-on-med-and-down " action="./Buscas/telabuscageral.php" method="post">
            <div class="input-field center">
                <input id="search" name="buscar" placeholder="Pesquisar" class="grey darken-3 white-text" type="search" required/>
                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
            </div>
        </form>-->
        <ul class = "right-align right hide-on-med-and-down">

            <%
                CarrinhoDAO cdao = new CarrinhoDAO();
                Usuario logado = null;
                if (request.getSession().getAttribute("logado") != null) {
                    logado = (Usuario) request.getSession().getAttribute("logado");
                    if (logado.getAdministrador() == 1) {
            %>
            <li class="hoverable"><a href = "cadastroProduto.jsp">Novo produto</a></li>
            <%
                }
            %>
            <li class="hoverable"><a href = "carrinho.jsp"><i class="material-icons">add_shopping_cart</i></a></li>
            <li class="hoverable"><a href = "carrinho.jsp"><span class="new badge" data-badge-caption="Item"><%= cdao.countCarrinho(logado.getId_usuario()) %></span></a></li>
            <li class="hoverable"><a href = "alteraPerfil.jsp"><%=logado.getNome()%></a></li>
            <li class="hoverable"><a href = "./UsuarioControle?action=logout">Sair</a></li>
                <%
                } else {
                %>
            <li class="hoverable"><a href = "./login.jsp">Login</a></li>
            <li class="hoverable"><a href = "./cadastro.jsp">Cadastre-se</a></li>
                <%
                    }
                %>
        </ul>

    </div>

</nav>
<a class="btn-floating hide-on-med-and-down btn-large grey darken-2" href="javascript:history.back()" style=" position: fixed; top: 80px; left: 20px; "><i class="material-icons">keyboard_backspace</i></a>
