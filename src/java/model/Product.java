/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import model.Category;
/**
 *
 * @author ASUS
 */

/*
ProductID varchar(10) NOT NULL primary key,
	ProductName nvarchar(100) NOT NULL,
	Price money CHECK(Price >= 0),
	Quantity int CHECK (Quantity > 0) NOT NULL,
	Describe nvarchar(100),
	Images varchar(100)
*/
public class Product {
    int id,quantity;
    String pname,describe,images,detail;
    double price;
    private Category category ;

    public Product() {
    }

    public Product(int id, int quantity, String pname, String describe, String images, String detail, double price, Category category) {
        this.id = id;
        this.quantity = quantity;
        this.pname = pname;
        this.describe = describe;
        this.images = images;
        this.detail = detail;
        this.price = price;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    }

 