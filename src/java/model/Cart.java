/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {

    String txt;
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemByID(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }

        return null;
    }

    public int getQuantityById(int id) {
        return getItemByID(id).getQuantity();
    }

    public void addItem(Item t) {
        // sp da co trong cart
        if (getItemByID(t.getProduct().getId()) != null) {
            Item i = getItemByID(t.getProduct().getId());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
            //chua co
            items.add(t);
        }

    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item i : items) {
            total += i.getQuantity() * i.getPrice();
        }
        return total;
    }

    private Product getProductByListId(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, Account a) {
        items = new ArrayList();
        ProductDAO dao = new ProductDAO();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int aid = Integer.parseInt(n[0]);
                    int id = Integer.parseInt(n[1]);
                    int quantity = Integer.parseInt(n[2]);
                    Product p = dao.getProductsById(id);

                    if (a != null) {
                        if (aid == 0 || aid == a.getAid()) {
                            addItem(new Item(p, quantity, p.getPrice()));
                        }
                    } else {
                        if (aid == 0) {
                            addItem(new Item(p, quantity, p.getPrice()));
                        }
                    }

                }

            }
        } catch (Exception e) {
        }

    }

}
