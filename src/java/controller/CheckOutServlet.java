/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CustomerDAO;
import dal.OrderDAO;
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
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author ASUS
 */
@WebServlet(name="CheckOutServlet", urlPatterns={"/checkout"})
public class CheckOutServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CustomerDAO d = new CustomerDAO();
        ProductDAO d2=new ProductDAO();
        Account a = (Account) request.getSession().getAttribute("account");
        if (a != null) {
            request.setAttribute("cus", d.getCustomerByAid(a.getAid()));
        }
        Cookie[] arr = request.getCookies();
       
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, a);
        request.setAttribute("cart", cart);
        request.setAttribute("listCart", cart.getItems());
        List<Category> listC = d2.getAllCategory();
        request.setAttribute("listC", listC);
        request.setAttribute("tag", "Checkout");
        request.setAttribute("current", "pages");
        

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session=request.getSession();
      
       Cookie[] arr = request.getCookies();
        PrintWriter pr = response.getWriter();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Account a = (Account) request.getSession().getAttribute("account");
        Cart cart = new Cart(txt, a);
        
        CustomerDAO dao = new CustomerDAO();
        OrderDAO dao2=new OrderDAO();
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if (a != null) {
            Customer cus = dao.getCustomerByAid(a.getAid());
            if (!name.equals(cus.getName()) || !phone.equals(cus.getPhoneNumber()) || !address.equals(cus.getAddress())) {
                dao.updateCustomer(name, phone, address, "" + a.getAid());
                cus=dao.getCustomerByAid(a.getAid());
               
                
            }
            dao2.addOrder(cus, cart);

        } else {
            dao.addCustomer(name, phone, address, null);
            dao2.addOrder(dao.getLastCustomer(), cart);
        }
        String[] ids = txt.split("/");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if (a != null) {
                if (!s[0].equals("" + a.getAid())) {
                    if (out.isEmpty()) {
                        out = ids[i];
                    } else {
                        out += "/" + ids[i];
                    }
                }
            } else {
                if (!s[0].equals("0") ) {
                    if (out.isEmpty()) {
                        out = ids[i];
                    } else {
                        out += "/" + ids[i];
                    }
                }
            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(60 * 60 * 2 * 24);
            response.addCookie(c);
        }
        response.sendRedirect("home");
            
        }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
