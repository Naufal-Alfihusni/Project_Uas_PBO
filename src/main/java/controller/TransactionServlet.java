/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.KoneksiDB;

/**
 *
 * @author naufa
 */
@WebServlet(name = "TransactionServlet", urlPatterns = {"/TransactionServlet"})
public class TransactionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Ambil data dari form kasir
        String totalAkhirStr = request.getParameter("total_akhir");
        String[] menuIds = request.getParameterValues("menu_id[]");
        String[] quantities = request.getParameterValues("qty[]");
        String[] subtotals = request.getParameterValues("subtotal[]");

        // Ambil ID User dari session (Pastikan saat login, ID user disimpan di session)
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        // Validasi data minimal
        if (menuIds == null || menuIds.length == 0 || totalAkhirStr == null) {
            response.sendRedirect("kasir.jsp?status=empty");
            return;
        }

        double totalAkhir = Double.parseDouble(totalAkhirStr);
        Connection conn = null;

        try {
            conn = KoneksiDB.getConnection();
            if (conn == null) {
                throw new SQLException("Gagal menyambung ke database");
            }

            // Matikan AutoCommit untuk memulai transaksi manual (ACID)
            conn.setAutoCommit(false);

            // 2. Simpan ke tabel 'transactions'
            // Gunakan RETURN_GENERATED_KEYS untuk mengambil ID transaksi yang baru saja dibuat
            String sqlTrans = "INSERT INTO transactions (total_akhir, user_id) VALUES (?, ?)";
            PreparedStatement psTrans = conn.prepareStatement(sqlTrans, Statement.RETURN_GENERATED_KEYS);
            psTrans.setDouble(1, totalAkhir);

            // Jika userId null (misal session habis), gunakan ID default atau tangani error
            if (userId != null) {
                psTrans.setInt(2, userId);
            } else {
                // Opsional: lempar error jika wajib login
                psTrans.setNull(2, java.sql.Types.INTEGER);
            }

            psTrans.executeUpdate();

            // Ambil ID Transaksi yang baru masuk
            int transactionId = 0;
            try (ResultSet rs = psTrans.getGeneratedKeys()) {
                if (rs.next()) {
                    transactionId = rs.getInt(1);
                }
            }

            // 3. Simpan detail item ke tabel 'transaction_items'
            String sqlItem = "INSERT INTO transaction_items (transaction_id, menu_id, quantity, subtotal) VALUES (?, ?, ?, ?)";
            try (PreparedStatement psItem = conn.prepareStatement(sqlItem)) {
                for (int i = 0; i < menuIds.length; i++) {
                    psItem.setInt(1, transactionId);
                    psItem.setInt(2, Integer.parseInt(menuIds[i]));
                    psItem.setInt(3, Integer.parseInt(quantities[i]));
                    psItem.setDouble(4, Double.parseDouble(subtotals[i]));
                    psItem.addBatch(); // Gunakan batch processing agar lebih cepat
                }
                psItem.executeBatch();
            }

            // 4. Jika semua berhasil, COMMIT perubahan ke database
            conn.commit();
            response.sendRedirect("kasir.jsp?status=success");

        } catch (SQLException | NumberFormatException e) {
            // Jika ada satu saja yang gagal, ROLLBACK semua perubahan
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            response.sendRedirect("kasir.jsp?status=error&msg=" + e.getMessage());
        } finally {
            // Tutup koneksi
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
