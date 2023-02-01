/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Category;
import model.Customer;

/**
 *
 * @author ASUS
 */
public class CustomerDAO extends DBContext {

    public void InsertNull(int aid) {
        String sql = "insert into Customer values(null,null,null,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer getCustomerByAid(int aid) {

        String sql = "select * from Customer where aid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCustomer(String name, String phone, String address, String aid) {
        String sql = "update customer set name=?,phoneNumber=?,address=? where aid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, aid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public void addCustomer(String name, String phone, String address, String aid){
        String sql = "insert into Customer values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, aid);
            st.executeUpdate();
           
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
   
    public Customer getLastCustomer(){
        String sql = "select top 1 * from [Customer] order by id desc";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
          
            if(rs.next()){
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch(Exception e){}
        return null;
    }
          


}
