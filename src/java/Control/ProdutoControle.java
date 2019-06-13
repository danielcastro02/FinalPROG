/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Daniel
 */
public class ProdutoControle extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            RequestDispatcher disp = request.getRequestDispatcher("");
            String funcao = request.getParameter("action");
            ProdutoDAO pdao = new ProdutoDAO();
            Produto pr;
            switch (funcao) {
                case "cadastro":

                    pr = new Produto(request);
                    if (pdao.cadastro(pr)) {
                        pr = pdao.selectCompleto(pr);
                        response.sendRedirect("./envioFoto.jsp?msg=" + Integer.toString(pr.getId_produto()));
                    } else {
                        response.sendRedirect("./index.jsp?msg=ERRO");
                    }

                    break;
                case "deletar":
                    if(pdao.delete(Integer.parseInt(request.getParameter("id_produto")))){
                        response.sendRedirect("./estoque.jsp");
                    }else{
                        response.sendRedirect("./index.jsp?msg=ERRO");
                    }
                    break;
                case "updateNome":
                    pr = new Produto();
                    pr.setNome(request.getParameter("nome"));
                    pr.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
                   out.print(pdao.updateNome(pr));
                    break;
                case "updateDescricao":
                    pr = new Produto();
                    pr.setDescricao(request.getParameter("descricao"));
                    pr.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
                    out.print(pdao.updateDescricao(pr));
                    break;
                case "updateValor":
                    pr = new Produto();
                    pr.setValor(Double.parseDouble(request.getParameter("valor")));
                    pr.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
                    out.print(pdao.updateValor(pr));
                    break;
                case "updateQuantia":
                    pr = new Produto();
                    pr.setQuantidade(Integer.parseInt(request.getParameter("quantia")));
                    pr.setId_produto(Integer.parseInt(request.getParameter("id_produto")));
                    out.print(pdao.updateQuantidade(pr));
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
