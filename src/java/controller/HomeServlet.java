/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Category;
import model.Item;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

       
        String numpage = request.getParameter("index");
        if (numpage == null) {
            numpage = "1";
        }
        int index = Integer.parseInt(numpage);

       
        ProductDAO dao = new ProductDAO();
        int count = dao.countProduct();
        //
        int totalPage = count / 6;
        if (count % 6 != 0) {
            totalPage++;
        }

        List<Product> list = dao.pagingProduct(index);
        request.setAttribute("index", index);
        request.setAttribute("list", list);
        request.setAttribute("total", totalPage);
        // get category + list all product

        List<Product> listp = dao.getAllProduct();
        List<Category> listc = dao.getAllCategory();
        //get lastest product
        Product last = dao.getLastest();
        
        List<Product> bestseller = dao.bestSeller();

        request.setAttribute("listp", listp);
        request.setAttribute("listc", listc);
        request.setAttribute("last", last);
        request.setAttribute("best", bestseller);
        
        
        
        
        Cookie[] arr = request.getCookies();
        String txt = "";
        Account a = (Account) request.getSession().getAttribute("account");
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, a);
        List<Item> listItem = cart.getItems();
//        int n;
//        if (listItem != null) {
//            n = listItem.size();
//        } else {
//            n = 0;
//        }
        if (a != null && !txt.isEmpty()) {
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }
            String p[] = txt.split("/");
            txt = "";
            for (int i = 0; i < p.length; i++) {
                String k[] = p[i].split(":");
                if (k[0].equals("0")) {
                    k[0] = "" + a.getAid();
                }
                if (i == 0) {
                    txt += k[0] + ":" + k[1] + ":" + k[2];
                } else {
                    txt += "/" + k[0] + ":" + k[1] + ":" + k[2] ;
                }
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 60 * 24 * 2);
            response.addCookie(c);
        }
         CustomerDAO dao2=new CustomerDAO();
          HttpSession session = request.getSession();
         String u=(String)session.getAttribute("u");
         
         
         session.setAttribute("user", u);
        request.getRequestDispatcher("home.jsp").forward(request, response);

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
