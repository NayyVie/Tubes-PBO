package model;

import java.io.Serializable;

public class Product implements Serializable {

    private int id;
    private String name;
    private int price;
    private String description;
    private String image;

    // constructor lama (biarkan)
    public Product(int id, String name, int price, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public Product(int id, String name, int price, String description, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    // ✅ constructor BARU (UNTUK SEWA)
    public Product(int id, String name, int price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    // getter
    public int getId() { return id; }
    public String getName() { return name; }
    public int getPrice() { return price; }
}
