/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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
import model.Item;
import model.Product;

/**
 *
 * @author ASUS
 */
@WebServlet(name="ProcessServlet", urlPatterns={"/process"})
public class ProcessServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ProcessServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath () + "</h1>");
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
      Cookie[] arr = request.getCookies();
      ProductDAO d=new ProductDAO();
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
        String num_raw=request.getParameter("num");// 
        String id_raw=request.getParameter("id");
        int id,num=0;
        
        try{
            id=Integer.parseInt(id_raw);
            Product p=d.getProductsById(id);
            int numstore = p.getQuantity();
            num=Integer.parseInt(num_raw);
            if(num==-1&&(cart.getQuantityById(id)<=1)){
                cart.removeItem(id);
            }else{
                if(num==1 && cart.getQuantityById(id)>=numstore){
                    num=0;
                }
                double price=p.getPrice();
                Item t=new Item(p, num, price);
                cart.addItem(t);
            }
        }catch(NumberFormatException e){
            
        }
        List<Item> items=cart.getItems();
        txt="";
        if (items.size() > 0) {
            if (a != null) {
                txt = a.getAid() + ":" + items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "/" + a.getAid() + ":" + items.get(i).getProduct().getId() + ":" + items.get(0).getQuantity();
                }

            } else {
                txt = 0 + ":" + items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "/" + 0 + ":" + items.get(i).getProduct().getId() + ":" + items.get(0).getQuantity();
                }
            }

        }
        Cookie c=new Cookie("cart", txt);
        c.setMaxAge(2*24*60*60);
        response.addCookie(c);
        request.setAttribute("car", cart);
        request.setAttribute("cart", items);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        processRequest(request, response);
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
