/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import model.Transaction;
import model.TransactionItem;
import util.KoneksiDB;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author naufa
 */
public class TransactionDAO {

    public boolean insertTransaction(Transaction trans) {
        Connection conn = null;
        try {
            conn = KoneksiDB.getConnection();
            conn.setAutoCommit(false); // Mulai transaksi manual

            // 1. Insert ke tabel transactions
            String sqlTrans = "INSERT INTO transactions (total_akhir, user_id, metode_pembayaran) VALUES (?, ?, ?) RETURNING id";
            PreparedStatement psTrans = conn.prepareStatement(sqlTrans);
            psTrans.setDouble(1, trans.getTotalAkhir());
            psTrans.setInt(2, trans.getUserId());
            psTrans.setString(3, trans.getMetodePembayaran());

            ResultSet rs = psTrans.executeQuery();
            if (rs.next()) {
                int transId = rs.getInt(1);

                // 2. Insert detail ke transaction_items
                String sqlItem = "INSERT INTO transaction_items (transaction_id, menu_id, quantity, subtotal) VALUES (?, ?, ?, ?)";
                PreparedStatement psItem = conn.prepareStatement(sqlItem);

                for (TransactionItem item : trans.getItems()) {
                    psItem.setInt(1, transId);
                    psItem.setInt(2, item.getMenuId());
                    psItem.setInt(3, item.getQuantity());
                    psItem.setDouble(4, item.getSubtotal());
                    psItem.addBatch();
                }
                psItem.executeBatch();
            }

            conn.commit();
            return true;
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public double getTotalPendapatan() {
        double total = 0;
        String sql = "SELECT SUM(total_akhir) FROM transactions";
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public int getTotalTransaksi() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM transactions";
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    // Method untuk mengambil daftar transaksi (misal 50 terakhir agar tidak berat)
    // Method untuk mengambil daftar transaksi
    // Method untuk mengambil detail item berdasarkan ID Transaksi

    public List<TransactionItem> getTransactionItems(int transId) {
        List<TransactionItem> list = new ArrayList<>();

        // Kita perlu melakukan JOIN ke tabel 'menus' untuk mendapatkan nama menu
        String sql = "SELECT ti.quantity, ti.subtotal, m.nama "
                + "FROM transaction_items ti "
                + "JOIN menus m ON ti.menu_id = m.id "
                + "WHERE ti.transaction_id = ?";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, transId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TransactionItem item = new TransactionItem();

                    // Ambil data dari database
                    item.setQuantity(rs.getInt("quantity"));
                    item.setSubtotal(rs.getDouble("subtotal"));

                    // Set nama menu (Penting: pastikan class TransactionItem punya field namaMenu)
                    item.setNamaMenu(rs.getString("nama"));

                    list.add(item);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error getTransactionItems: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }
    // Tambahkan ini di dalam class TransactionDAO

    public List<Transaction> getAllTransactions() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions ORDER BY id DESC"; // Ambil semua kolom

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setId(rs.getInt("id"));
                t.setTotalAkhir(rs.getDouble("total_akhir"));
                t.setUserId(rs.getInt("user_id"));
                t.setTanggal(rs.getTimestamp("tanggal"));

                // AMBIL KOLOM METODE PEMBAYARAN
                String metode = rs.getString("metode_pembayaran");
                t.setMetodePembayaran(metode != null ? metode : "CASH");

                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    // Tambahkan method ini di dalam class TransactionDAO

    // Masukkan method ini ke dalam class TransactionDAO
    public List<Transaction> getRecentTransactions(int limit) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions ORDER BY id DESC LIMIT ?";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Transaction t = new Transaction();
                    t.setId(rs.getInt("id"));
                    t.setTotalAkhir(rs.getDouble("total_akhir"));
                    t.setUserId(rs.getInt("user_id"));
                    t.setTanggal(rs.getTimestamp("tanggal"));

                    // TAMBAHKAN INI:
                    String metode = rs.getString("metode_pembayaran");
                    t.setMetodePembayaran(metode != null ? metode : "CASH");

                    list.add(t);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
