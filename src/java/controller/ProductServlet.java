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
@WebServlet(name="ProductServlet", urlPatterns={"/product"})
public class ProductServlet extends HttpServlet {
   
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
        
         // get number of page onclick
         String numpage=request.getParameter("index");
         
         
          if(numpage==null){
              numpage="1";
          }
        int index=Integer.parseInt(numpage);
        
       
        ProductDAO dao=new ProductDAO();
        
        String cid_raw=request.getParameter("cid");
        int cid;
       
        
        //get total page of product
            cid=Integer.parseInt(cid_raw);
            int count =dao.countProductByCid(cid);//29
            int totalPage=count/6; 
        if(count%6 !=0){
            totalPage++;
        }
        
        try {
            
            List<Product> list=dao.pagingProductByCid(index,cid);
            List<Product> list1=dao.getProductsByCid(cid);
            if(list.isEmpty()){
                request.setAttribute("ms", "adda");
            }
            request.setAttribute("index", index);
            request.setAttribute("list", list);
            request.setAttribute("product", list1);
            List<Category> list2=dao.getAllCategory();
            request.setAttribute("cate", list2);
            request.setAttribute("cid",cid);
            request.setAttribute("end", totalPage);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
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
