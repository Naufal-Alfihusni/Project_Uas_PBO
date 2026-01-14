package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.KoneksiDB; // Menggunakan utilitas koneksi Anda

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Ambil data dari form login.jsp [cite: 48, 49]
        String userParam = request.getParameter("username");
        String passParam = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 2. Dapatkan koneksi dari KoneksiDB.java
            conn = KoneksiDB.getConnection();

            // 3. Query untuk memverifikasi username, password, dan mengambil nama role
            // Query ini mengasumsikan Anda memiliki tabel 'users' yang terhubung dengan tabel 'roles'
            String sql = "SELECT u.username, r.nama_role "
                    + "FROM users u "
                    + "JOIN roles r ON u.role_id = r.id "
                    + "WHERE u.username = ? AND u.password = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, userParam);
            ps.setString(2, passParam);
            rs = ps.executeQuery();

            if (rs.next()) {
                // --- LOGIN BERHASIL ---
                String username = rs.getString("username");
                String role = rs.getString("nama_role");

                // 4. Inisialisasi Session untuk memisahkan type user [cite: 25, 26]
                HttpSession session = request.getSession();
                session.setAttribute("userName", username);
                session.setAttribute("userRole", role); // Menyimpan role (admin/kasir)

                // Set durasi session (misal 30 menit)
                session.setMaxInactiveInterval(30 * 60);

                // 5. Redirect ke dashboard utama (index.jsp) [cite: 2, 3]
                response.sendRedirect("dashboard.jsp");

            } else {
                // --- LOGIN GAGAL ---
                // Kembali ke login dengan pesan error
                response.sendRedirect("login.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=db");
        } finally {
            // Menutup resources database secara manual
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Jika diakses via GET, arahkan langsung ke login.jsp
        response.sendRedirect("login.jsp");
    }
}
