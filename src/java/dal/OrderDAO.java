/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetailProductOrder;

/**
 *
 * @author ASUS
 */
public class OrderDAO extends DBContext {

    public void addOrder(Customer c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {

            String sql = "insert into [order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, c.getId());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();

            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

            String sql3 = "update product set quantity=quantity-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {

        }
    }

    public List<OrderDetailProductOrder> OrderDetailProductOrder(String date) {
        ArrayList<OrderDetailProductOrder> ls = new ArrayList<>();

//        double sum = 0;
        try {
            String sql = "SELECT \n"
                    + "		p.[pname]\n"
                    + "      ,od.[quantity]\n"
                    + "      ,p.[price]\n"
                    + "	  , totalmoney\n"
                    + "	  ,[date]\n"
                    + "	FROM [Order] o join OrderDetail od\n"
                    + "	on o.id = od.oid\n"
                    + "	join Product p\n"
                    + "	on od.pid= p.ID\n"
                    + "\n"
                    + "	where totalmoney!=0 and [date]=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderDetailProductOrder c = new OrderDetailProductOrder();
                c.setPname(rs.getString("pname"));
                c.setQuantity(rs.getInt("quantity"));
                c.setPrice(rs.getDouble("price"));
                c.setTotalmoney(rs.getDouble("totalmoney"));
                c.setDate(rs.getString("date"));
                ls.add(c);
            }
        } catch (SQLException e) {

        }

        return ls;
    }
    
    
    public List<Order> numProductPerDay() {
        List<Order> ls = new ArrayList<>();
        String sql = "SELECT  count([date]) as'Num'\n"
                + "			,date	\n"
                + "         FROM [Order] \n"
                + "	where totalmoney!=0 \n"
                + "	group by [date]";

//        double sum = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Order c = new Order();
                c.setDate(rs.getString("date"));
                c.setNum(rs.getInt("Num"));
                ls.add(c);
            }
        } catch (SQLException e) {

        }
        return ls;


}
}