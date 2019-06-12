
<%-- 
    Document   : index
    Created on : 25/05/2019, 16:18:17
    Author     : Daniel
--%>


<%@page import="Model.Usuario"%>
<%
    if (session.getAttribute("logado") == null) {
        response.sendRedirect("login.jsp");
    }
%>
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
            Usuario us = (Usuario) session.getAttribute("logado");

        %>
        <main>
            <div class="row">
                <div class="col s6 offset-s3 card">
                    <form action="UsuarioControle?action=updateFoto&id_usuario=<%= ((Usuario)session.getAttribute("logado")).getId_usuario() %>" method="post" enctype="multipart/form-data" class="row">

                        <div class="file-field input-field col s9 center">
                            <h4>Insira sua nova foto de perfil</h4>
                            <div class="btn">
                                <span>Nova Foto</span>
                                <input type="file" name="file" class="file-chos" id="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate"  type="text">
                            </div>

                        </div>
                        <div class="col s3 right" style="margin-top: 20px;">
                            <img  class="fotoPerfil prev-img right">

                        </div>
                        <div class="row center">
                            
                            <input type="submit" class="btn" value="Confirmar"/>
                            
                        </div>
                        
                    </form>


                    <script>
                        const $ = document.querySelector.bind(document);
                        const previewImg = $('.prev-img');
                        const fileChooser = $('.file-chos');

                        fileChooser.onchange = e => {
                            const fileToUpload = e.target.files.item(0);
                            const reader = new FileReader();

                            // evento disparado quando o reader terminar de ler 
                            reader.onload = e => previewImg.src = e.target.result;

                            // solicita ao reader que leia o arquivo 
                            // transformando-o para DataURL. 
                            // Isso disparará o evento reader.onload.
                            reader.readAsDataURL(fileToUpload);
                        };
                    </script>
                </div>
            </div>
        </main>

    </body>
</html>
