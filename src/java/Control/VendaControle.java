/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.ProdutoVendido;
import Model.Usuario;
import Model.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DateFormatter;

/**
 *
 * @author Daniel
 */
public class VendaControle extends HttpServlet {

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
            VendaDAO vdao = new VendaDAO();
            CarrinhoDAO cdao = new CarrinhoDAO();
            switch (funcao) {
                case "vender":

                    Venda v = new Venda();
                    v.setValor(Double.parseDouble(request.getParameter("valor")));
                    v.setId_usuario(((Usuario) session.getAttribute("logado")).getId_usuario());
                    v = vdao.vender(v);
                    if (v != null) {
                        String[] carrinhos;
                        carrinhos = request.getParameterValues("id_carrinho");
                        String[] ids = request.getParameterValues("id_produto");
                        String[] qds = request.getParameterValues("quantia");
                        ProdutoVendidoDAO pvd = new ProdutoVendidoDAO();
                        for (int i = 0; i < ids.length; i++) {
                            if (request.getParameterValues("id_carrinho") != null) {
                                cdao.delete(Integer.parseInt(carrinhos[i]));
                            }
                            ProdutoVendido pv = new ProdutoVendido();
                            pv.setId_venda(v.getId_venda());
                            pv.setId_produto(Integer.parseInt(ids[i]));
                            pv.setQuantidade(Integer.parseInt(qds[i]));
                            pvd.inserir(pv);
                        }
                        response.sendRedirect("./index.jsp?msg=vendido");
                    } else {
                        response.sendRedirect("./index.jsp?msg=ERRO");
                    }

                    break;
                case "relatorioVendasData":
                    request.setAttribute("ListaVendidos", vdao.selectDataMaior(request.getParameter("inicio"), request.getParameter("fim")));
                    disp = request.getRequestDispatcher("./relatorioMaisVendido.jsp");
                    disp.forward(request, response);
                    break;
                case "relatorioUsuariosAtivos":
                    request.setAttribute("ListaUsuariosResult", vdao.selectUsuariosAtivos(request.getParameter("inicio"), request.getParameter("fim")));
                    disp = request.getRequestDispatcher("./usuariosAtivos.jsp");
                    disp.forward(request, response);

                    break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(VendaControle.class.getName()).log(Level.SEVERE, null, ex);
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
