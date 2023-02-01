/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class OrderDetailProductOrder {
    String pname,date;
    int quantity;
    double price,totalmoney;

    public OrderDetailProductOrder() {
    }

    public OrderDetailProductOrder(String pname, String date, int quantity, double price, double totalmoney) {
        this.pname = pname;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
        this.totalmoney = totalmoney;
    }

    public OrderDetailProductOrder(String pname, int quantity, double price, double totalmoney) {
        this.pname = pname;
        this.quantity = quantity;
        this.price = price;
        this.totalmoney = totalmoney;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }
    
    
}
