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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author ASUS
 */
@WebServlet(name="UpdateServlet", urlPatterns={"/update"})
public class UpdateServlet extends HttpServlet {
   
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
        String id_raw=request.getParameter("id");
         ProductDAO dao=new ProductDAO();
        int id;
        try {
            id=Integer.parseInt(id_raw);
            Product p=dao.getProductsById(id);
            List<Category> c=dao.getAllCategory();
            request.setAttribute("detail", p);
            request.setAttribute("listc", c);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (Exception e) {
        }
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
        // load information
        ProductDAO d=new ProductDAO();
        List<Product> listp=d.getAllProduct();
        List<Category> listc=d.getAllCategory();
        String id_raw=request.getParameter("id");
        String name=request.getParameter("name");
        String price_raw=request.getParameter("price");
        String quantity_raw=request.getParameter("quantity");
        String describe=request.getParameter("describe");
        String image=request.getParameter("image");
        String category=request.getParameter("category");
        String detail=request.getParameter("detail");
        //fail
        if(name.isEmpty() || price_raw.isEmpty() || quantity_raw.isEmpty()|| describe.isEmpty() || image.isEmpty() || category.equals("0")
                || detail.isEmpty()){

         ProductDAO dao=new ProductDAO();
        int id;
        try {
            id=Integer.parseInt(id_raw);
            Product p=dao.getProductsById(id);
            List<Category> c=dao.getAllCategory();
            request.setAttribute("detail", p);
            request.setAttribute("listc", c);
             request.setAttribute("ms", "Fail because of missing some element");
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (Exception e) {
        }
        
        
        }
        
       
        int quantity,id;
        double price;
        try {
            id=Integer.parseInt(id_raw);
           
            price=Double.parseDouble(price_raw);
            quantity=Integer.parseInt(quantity_raw);
        ProductDAO dao=new ProductDAO();
        dao.update(id,name, price, quantity, describe, image,detail,category);
        response.sendRedirect("manage");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        
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
