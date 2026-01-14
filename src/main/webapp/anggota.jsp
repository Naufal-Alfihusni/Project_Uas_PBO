<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Cek Login
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kelola Staff</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            /* Satu-satunya CSS manual yang diperlukan: Memberi jarak untuk konten utama */
            .main-content {
                margin-left: 280px; /* Sesuai lebar sidebar */
                padding: 20px;
                min-height: 100vh;
                background-color: #f8f9fa; /* Warna background abu-abu muda ala dashboard */
            }
        </style>
    </head>
    <body>

        <%@include file="sidebar.jsp" %>

        <main class="main-content">
            <div class="container-fluid">

                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Kelola Staff</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <button type="button" class="btn btn-sm btn-outline-secondary">
                            <i class="fas fa-plus"></i> Tambah Staff Baru
                        </button>
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body">
                        <p>Isi tabel anggota atau form anggota Anda disini...</p>
                    </div>
                </div>

            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>