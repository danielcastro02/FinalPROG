<%-- 
    Document   : login
    Created on : 26/05/2019, 17:18:42
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="row">
                <div class="col s4 offset-s4 card">
                    <form method="post" action="UsuarioControle?action=login">
                        <div class="row col s10 offset-s2 pull-s1 center">
                            <h4 class="col s8 offset-s2">Login</h4>
                            <div class="input-field col s12">
                                <input type="text" name="usuario" class="input-field"/>
                                <label for='usuario'>Usuario:</label>
                            </div>
                            <div class="input-field col s12">
                                <input type="password" name="senha1" class="input-field"/>
                                <label for='senha1'>Senha:</label>
                            </div>

                            
                        </div>

                        <div class="row center">
                            <a href="./index.jsp" class="btn red darken-2">Voltar</a>
                            <input type="submit" class="btn black" value="Login"/>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
    
  
</html>