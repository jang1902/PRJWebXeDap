/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Customer;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends DBContext{
    //check tài khoản
    public Account check(String username, String password){
        String sql="select * from Account where Username=? and Password=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,username);
            st.setString(2,password);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new Account(rs.getInt("aid"),username, password,rs.getInt("role"));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Account checkAccountExist(String user){
        String sql="select * from Account where Username=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,user);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new Account(rs.getInt(1),
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public void signup(String user,String pass){
        String sql="insert into Account values (?,?,0)";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,user);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void changepass(String pass,String aid){
        String sql="update Account set password=? where aid=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,pass);
            st.setString(2, aid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public int getLastAidAccount(){
        String sql="select top 1 aid from account order by aid desc";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
          
            if(rs.next()){
              int i= rs.getInt(1);
              return i;
            }
        } catch(Exception e){}
        return 0;
    }
    
}
