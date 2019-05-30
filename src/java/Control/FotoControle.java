/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Foto;
import Model.Produto;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
public class FotoControle extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            RequestDispatcher disp = request.getRequestDispatcher("");
            String funcao = request.getParameter("action");
            FotoDAO fdao = new FotoDAO();
            Foto f = new Foto();
            switch (funcao) {
                case "cadastro":
                    if (ServletFileUpload.isMultipartContent(request)) {
                        try {
                            /*Faz o parse do request*/
                            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                            /*Escreve a o arquivo na pasta img*/
                            for (FileItem item : multiparts) {
                                
                                if (!item.isFormField()) {
                                    String id_produto = request.getParameter("id_produto");
                                    String nome = id_produto + Integer.toString((int) (Math.random() * 1000000000));
                                    System.out.println("ksdhfbgkaserhf");
                                    String caminho = request.getServletContext().getRealPath("Imagens") + "/../../../web/Imagens/" + nome + ".jpg";
                                    System.out.println(caminho);
                                    item.write(new File(caminho));
                                    System.out.println(id_produto);
                                    f.setId_produto(Integer.parseInt(id_produto));
                                    f.setCaminho(nome + ".jpg");
                                    System.out.println(f.getId_produto() + "\n\n" + f.getCaminho());
                                    fdao.cadastrar(f);
                                }
                            }
                            response.sendRedirect("./index.jsp?msg=Sucesso");

                        } catch (Exception ex) {
                            response.sendRedirect("./index.jsp?msg=ERRO");

                        }

                    } else {
                        request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
