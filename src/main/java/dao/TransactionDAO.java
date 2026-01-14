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
            String sqlTrans = "INSERT INTO transactions (total_akhir, user_id) VALUES (?, ?) RETURNING id";
            PreparedStatement psTrans = conn.prepareStatement(sqlTrans);
            psTrans.setDouble(1, trans.getTotalAkhir());
            psTrans.setInt(2, trans.getUserId());

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

        // Query mengambil data transaksi diurutkan dari yang terbaru (DESC)
        String sql = "SELECT * FROM transactions ORDER BY id DESC";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setId(rs.getInt("id"));
                t.setTotalAkhir(rs.getDouble("total_akhir"));
                t.setUserId(rs.getInt("user_id"));

                // Pastikan kolom tanggal ada di database. 
                // Jika nama kolomnya 'created_at' atau lainnya, sesuaikan di sini.
                try {
                    t.setTanggal(rs.getTimestamp("tanggal"));
                } catch (Exception e) {
                    // Jika kolom tanggal error/tidak ada, abaikan dulu agar tidak crash
                    System.out.println("Warning: Kolom tanggal tidak terbaca/kosong");
                }

                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
