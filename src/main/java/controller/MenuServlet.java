package controller;

import dao.MenuDAO;
import model.Menu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "MenuServlet", urlPatterns = {"/MenuServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5)
public class MenuServlet extends HttpServlet {

    // Menangani Hapus (via Link/GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            new MenuDAO().deleteMenu(id);
        }
        response.sendRedirect("datamenu.jsp");
    }

    // Menangani Tambah & Edit (via Form/POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MenuDAO dao = new MenuDAO();
        String idStr = request.getParameter("id"); // Ambil ID dari input hidden
        String nama = request.getParameter("nama");
        double harga = Double.parseDouble(request.getParameter("harga"));
        String kategori = request.getParameter("kategori");

        // Proses Foto
        Part part = request.getPart("foto");
        String fileName = part.getSubmittedFileName();

        // Jika tidak upload foto baru, cari foto lama (untuk update) atau gunakan default
        if (fileName == null || fileName.isEmpty()) {
            fileName = request.getParameter("oldFoto") != null ? request.getParameter("oldFoto") : "default.jpg";
        } else {
            // --- PERUBAHAN DISINI ---

            // GANTI string di bawah ini dengan lokasi folder 'assets/img/menu' di project ASLI kamu
            // Contoh: "C:/Users/NamaKamu/Documents/NetBeansProjects/TampilanResto/src/main/webapp/assets/img/menu"
            // Tips: Buka File Explorer, cari folder gambarnya, copy address bar-nya.
            // PENTING: Gunakan double backslash (\\) atau single slash (/) untuk pemisah folder di Windows.
            String UPLOAD_DIRECTORY = "C:\\Users\\naufa\\OneDrive\\Dokumen\\NetBeansProjects\\tampilanresto\\src\\main\\webapp\\assets\\img\\menu";

            File fileSaveDir = new File(UPLOAD_DIRECTORY);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            // Simpan ke folder Source Code (agar permanen)
            part.write(UPLOAD_DIRECTORY + File.separator + fileName);

            // Opsi Tambahan (Opsional):
            // Agar langsung tampil tanpa perlu clean-build, simpan JUGA ke folder build saat ini
            String buildPath = getServletContext().getRealPath("/") + "assets/img/menu";
            part.write(buildPath + File.separator + fileName);
        }

        if (idStr == null || idStr.isEmpty()) {
            // INSERT
            dao.insertMenu(new Menu(nama, harga, kategori, fileName));
        } else {
            // UPDATE
            Menu m = new Menu(nama, harga, kategori, fileName);
            m.setId(Integer.parseInt(idStr));
            dao.updateMenu(m);
        }
        response.sendRedirect("datamenu.jsp");
    }
}
