/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Item;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author ASUS
 */
public class ProductDAO extends DBContext {

   
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        String sql = "select * from Product order by id ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

   
    public Product getLastest() {
        String sql = "select top 1* from Product\n"
                + "order by id desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

   
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("cid"));// đọc từ bảng
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

   
    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

  
    public Product getProductsById(int id) {

        String sql = "select * from Product where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    
    public Category getCategoryByID(int cid) {

        String sql = "select * from Category where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("name"));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    
    public void delete(int id) {
        String sql = "delete from Product where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // set giá trị "?" 
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    
    public void insert(String name, double price, int quantity, String describe, String image, String detail, int category) {
        String sql = "insert into Product values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, price);
            st.setInt(3, quantity);
            st.setString(4, describe);
            st.setString(5, image);
            st.setString(6, detail);
            st.setInt(7, category);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

   
    public void update(int id, String name, double price, int quantity, String describe, String image, String detail, String category) {
        String sql = "update Product\n"
                + "set pname=?,\n"
                + "  price=?,\n"
                + "  quantity=?,\n"
                + "  describe=?,\n"
                + "  images=?,\n"
                + "  detail=?,\n"
                + "  cid=?\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setDouble(2, price);
            st.setInt(3, quantity);
            st.setString(4, describe);
            st.setString(5, image);
            st.setString(6, detail);
            st.setString(7, category);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    
    public List<Product> SearchByName(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where pname like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    
    public int countProduct() {
        String sql = "select count(*) from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);// bang result co 1 kq
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public int countProductByCid(int cid) {
        String sql = "select count(*) from product where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);// bang result co 1 kq
            }
        } catch (Exception e) {
        }
        return 0;
    }

    
    public List<Product> pagingProduct(int number) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (number - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> pagingProductByCid(int number,int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product \n"
                + "where cid=?\n"
                + " order by id\n"
                + "offset ? rows fetch next 6 rows only ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            st.setInt(2, (number - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));// đọc từ bảng
                p.setQuantity(rs.getInt("quantity"));
                p.setPname(rs.getString("pname"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getDouble("price"));
                p.setDetail(rs.getString("detail"));
                Category c = getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }


    
    public List<Product> bestSeller() {
        List<Product> list=new ArrayList<>();
        ProductDAO dao=new ProductDAO();
        String sql = "select top 3 pid from OrderDetail order by quantity desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                
                int t=rs.getInt("pid");
                Product p=dao.getProductsById(t);
                    list.add(p);
                }
                
            
        } catch (Exception e) {
        }
        return null;
    }
    
    public void insertCate(int id, String name) {
        String sql = "insert into Category values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
              st.setString(2, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public void deleteCate(int cid) {
        String sql = "delete from category where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
           
            st.setInt(1, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     
       public void updateCate(int id, String name) {
        String sql = "update category set name=? where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, name);
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
       
  
}
