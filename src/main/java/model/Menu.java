package model;

public class Menu {

    private int id;
    private String nama;
    private double harga;
    private String kategori;
    private String foto;

    public Menu() {
    }

    // Constructor untuk insert data baru
    public Menu(String nama, double harga, String kategori, String foto) {
        this.nama = nama;
        this.harga = harga;
        this.kategori = kategori;
        this.foto = foto;
    }

    // Getter dan Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}
