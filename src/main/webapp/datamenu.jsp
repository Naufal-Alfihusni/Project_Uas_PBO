<%@page import="model.Menu, dao.MenuDAO, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Proteksi Halaman
    String role = (String) session.getAttribute("userRole");
    if (role == null || !role.equalsIgnoreCase("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Manajemen Menu | Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            :root {
                --gold: #c5a059;
                --dark: #0f1116;
            }
            body {
                background-color: #f4f7f6;
            }
            .btn-gold {
                background-color: var(--gold);
                color: white;
                border-radius: 50px;
            }
            .table-container {
                background: white;
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            }
        </style>
    </head>
    <body>
        <jsp:include page="sidebar.jsp" />

        <div style="margin-left: 260px; padding: 40px;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold" style="font-family: 'Playfair Display', serif;"><i class="bi bi-egg-fried me-2 text-warning" ></i> Kelola Menu</h2>
                <button class="btn btn-gold px-4" onclick="tambahMenu()">
                    <i class="bi bi-plus-lg me-2"></i> Tambah Menu Baru
                </button>
            </div>

            <div class="table-container">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Foto</th>
                            <th>Nama Menu</th>
                            <th>Kategori</th>
                            <th>Harga</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            MenuDAO dao = new MenuDAO();
                            List<Menu> listMenu = dao.getAllMenu();
                            for (Menu m : listMenu) {
                        %>
                        <tr>
                            <td>
                                <img src="assets/img/menu/<%= m.getFoto()%>" class="rounded-3" 
                                     style="width: 60px; height: 60px; object-fit: cover;"
                                     onerror="this.src='https://via.placeholder.com/60'">
                            </td>
                            <td class="fw-bold"><%= m.getNama()%></td>
                            <td><span class="badge bg-light text-dark border"><%= m.getKategori()%></span></td>
                            <td class="text-success fw-bold">Rp <%= String.format("%,.0f", m.getHarga())%></td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-outline-primary rounded-pill px-3" 
                                        onclick="editMenu('<%= m.getId()%>', '<%= m.getNama()%>', '<%= m.getHarga()%>', '<%= m.getKategori()%>', '<%= m.getFoto()%>')">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <a href="MenuServlet?action=delete&id=<%= m.getId()%>" 
                                   onclick="return confirm('Yakin hapus?')" class="btn btn-sm btn-danger rounded-pill px-3">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="modalTambah" tabindex="-1">
            <div class="modal-dialog">
                <form action="MenuServlet" method="POST" enctype="multipart/form-data" class="modal-content rounded-4 border-0">
                    <div class="modal-header border-0">
                        <h5 class="fw-bold" id="modalTitle">Tambah Menu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body p-4">
                        <input type="hidden" name="id" id="menuId">
                        <input type="hidden" name="oldFoto" id="menuOldFoto">

                        <div class="mb-3">
                            <label class="form-label small fw-bold">Nama Menu</label>
                            <input type="text" name="nama" id="menuNama" class="form-control rounded-3" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold">Harga (Rp)</label>
                                <input type="number" name="harga" id="menuHarga" class="form-control rounded-3" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold">Kategori</label>
                                <select name="kategori" id="menuKategori" class="form-select rounded-3">
                                    <option value="Makanan">Makanan</option>
                                    <option value="Minuman">Minuman</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Foto Menu (Kosongkan jika tidak ganti)</label>
                            <input type="file" name="foto" class="form-control rounded-3">
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <button type="submit" class="btn btn-gold w-100 py-2 fw-bold">SIMPAN DATA</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                       const modal = new bootstrap.Modal(document.getElementById('modalTambah'));

                                       function tambahMenu() {
                                           document.getElementById('modalTitle').innerText = "Tambah Menu Baru";
                                           document.getElementById('menuId').value = "";
                                           document.getElementById('menuOldFoto').value = "";
                                           document.getElementById('menuNama').value = "";
                                           document.getElementById('menuHarga').value = "";
                                           modal.show();
                                       }

                                       function editMenu(id, nama, harga, kategori, foto) {
                                           document.getElementById('modalTitle').innerText = "Edit Menu";
                                           document.getElementById('menuId').value = id;
                                           document.getElementById('menuNama').value = nama;
                                           document.getElementById('menuHarga').value = harga;
                                           document.getElementById('menuKategori').value = kategori;
                                           document.getElementById('menuOldFoto').value = foto;
                                           modal.show();
                                       }
        </script>
    </body>
</html>