<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
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
        <%
            try {
                if (request.getParameter("msg").equals("ERRO")) {
        %>
        <script>
            alert('Compartamento inesperado do sistema, por favor tente novamente, mesmo que nos não tenhamos mudado nada ainda...');
        </script>
        <%
                }
            } catch (Exception e) {

            }
        %>

        <div class="col l10 card" style="width: 1600px; margin-left: auto; margin-right: auto;">
            <br><br><br><br><br><br>
            <h2 class="center">Destaques</h2>
            <br><br>
        </div>

    </body>
</html>
