<%@page import="Model.Usuario"%>
<nav  class="black z-depth-1" style="position: fixed;">
    <div class = "row nav-wrapper">
        <a class="col s4 left-align" tabindex="2" href = "./home.php" style = "margin-left: 30px; font-size: 40px">CardtinhaShop</a>
        <form class="col s4 hide-on-med-and-down " action="./Buscas/telabuscageral.php" method="post">
            <div class="input-field center">
                <input id="search" name="buscar" placeholder="Pesquisar" class="grey darken-3 white-text" type="search" required/>
                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
            </div>
        </form>
        <ul class = "right-align right hide-on-med-and-down">
            <li class="hoverable"><a href = "./index.php">Home</a></li>
                <%
                    Usuario logado = null;
                    if (request.getSession().getAttribute("logado") != null) {
                        logado = (Usuario) request.getSession().getAttribute("logado");
                %>
            <li class="hoverable"><a href = "alteraPerfil.jsp"><%=logado.getNome()%></a></li>
                <%
                } else {
                %>
                <li class="hoverable"><a href = "./cadastro.jsp">Cadastre-se</a></li>
            <%
                }
            %>

            <li class="hoverable"><a href = "./Controles/server.php?logout=sair" style="margin-right: 25px">Sair</a></li>
        </ul>

    </div>

</nav>
<a class="btn-floating hide-on-med-and-down btn-large grey darken-2" href="javascript:history.back()" style=" position: fixed; top: 80px; left: 20px; "><i class="material-icons">keyboard_backspace</i></a>
