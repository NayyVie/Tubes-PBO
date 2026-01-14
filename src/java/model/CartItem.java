package model;

import java.io.Serializable;

public class CartItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private int productId;
    private String name;
    private int price;
    private int qty;

    public CartItem(int productId, String name, int price, int qty) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getQty() {
        return qty;
    }

    public int getSubtotal() {
        return price * qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
}
