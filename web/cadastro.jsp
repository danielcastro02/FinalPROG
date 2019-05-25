
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
            <div class="col s8 offset-s2 card">
                <form method="post" action="UsuarioControle?action=cadastro">
                    <div class="row">
                        <div class="input-field col s6">
                            <input type="text" name="nome" class="input-field"/>
                            <label for='nome'>Nome:</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        </main>
    </body>
</html>
