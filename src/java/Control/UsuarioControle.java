/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author 2017007243
 */
@WebServlet(name = "controle", urlPatterns = {"/controle"})
public class UsuarioControle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            RequestDispatcher disp = request.getRequestDispatcher("");
            String funcao = request.getParameter("action");
            Usuario us = new Usuario(request);
            UsuarioDAO udao = new UsuarioDAO();
            switch (funcao) {
                case "cadastro":
                    if (request.getParameter("senha1").equals(request.getParameter("senha2"))) {

                        if (udao.cadastro(us)) {
                            response.sendRedirect("./index.jsp?msg=usuarioCadastrado");
                        } else {
                            response.sendRedirect("./index.jsp?msg=ERRO");
                        }
                    } else {
                        response.sendRedirect("./index.jsp?msg=ERRO");

                    }
                    break;
                case "login":
                    us = udao.login(us);
                    if (us != null) {
                        session.setAttribute("logado", us);
                        response.sendRedirect("./index.jsp?msg=logado");
                    } else {
                        response.sendRedirect("./index.jsp?msg=ERRO");
                    }

                    break;
                case "logout":
                    session.removeAttribute("logado");
                    response.sendRedirect("./index.jsp?msg=deslogado");
                    break;

                case "update":
                    Usuario user = new Usuario(request);
                    if (udao.update(user)) {
                        response.sendRedirect("./index.jsp");
                    } else {
                        response.sendRedirect("./index.jsp?msg=ERRO");
                    }
                    break;
                case "updateFoto":
                    try {
                        /*Faz o parse do request*/
                        List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                        /*Escreve a o arquivo na pasta img*/
                        for (FileItem item : multiparts) {

                            if (!item.isFormField()) {
                                Usuario use = (Usuario) session.getAttribute("logado");
                                String id_usuario = request.getParameter("id_usuario");
                                String nome = "profile" + id_usuario + Integer.toString((int) (Math.random() * 999999999));
                                System.out.println("ksdhfbgkaserhf");
                                String caminho = request.getServletContext().getRealPath("Imagens") + "/" + nome + ".jpg";
                                System.out.println(caminho);
                                item.write(new File(caminho));
                                System.out.println(id_usuario);
                                use.setId_usuario(Integer.parseInt(id_usuario));
                                if (!(use.getFoto_perfil().equals("userGeneric.png"))) {
                                    File antigo = new File(request.getServletContext().getRealPath("Imagens") + '/' + use.getFoto_perfil());
                                    System.out.println(antigo.getAbsolutePath());
                                    antigo.delete();
                                    antigo = new File(request.getServletContext().getRealPath("Imagens") + "/../../../web/Imagens/" + use.getFoto_perfil());
                                    System.out.println(antigo.getAbsolutePath());
                                    antigo.delete();
                                }
                                use.setFoto_perfil(nome + ".jpg");
                                udao.updatePerfil(use);
                                session.setAttribute("logado", use);
                            }
                        }
                        response.sendRedirect("./index.jsp?msg=Sucesso");

                    } catch (Exception ex) {
                        response.sendRedirect("./index.jsp?msg=ERRO");
                        System.out.println(ex.getMessage());
                    }
                    break;
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioControle.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioControle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioControle.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioControle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
