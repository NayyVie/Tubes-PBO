
package model;

import java.time.LocalDate;
import java.util.List;



public class RentalTransaction {

    private String nama;
    private String metodeBayar;
    private int total;
    private LocalDate tanggalSewa;
    private LocalDate tanggalKembali;
    private List<CartItem> items;

    public RentalTransaction(String nama, String metodeBayar, int total,
                             LocalDate tanggalSewa, LocalDate tanggalKembali,
                             List<CartItem> items) {
        this.nama = nama;
        this.metodeBayar = metodeBayar;
        this.total = total;
        this.tanggalSewa = tanggalSewa;
        this.tanggalKembali = tanggalKembali;
        this.items = items;
    }

    public String getNama() { return nama; }
    public String getMetodeBayar() { return metodeBayar; }
    public int getTotal() { return total; }
    public LocalDate getTanggalSewa() { return tanggalSewa; }
    public LocalDate getTanggalKembali() { return tanggalKembali; }
    public List<CartItem> getItems() { return items; }
}

