<%@page import="java.util.List, dao.MenuDAO, model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Daftar Menu - Kopi Ciwidey</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .menu-card {
                border: none;
                border-radius: 15px;
                transition: 0.3s;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            .menu-card:hover {
                transform: translateY(-10px);
            }
            .img-container {
                height: 200px;
                width: 100%;
                overflow: hidden;
            }
            .img-container img {
                object-fit: cover;
                height: 100%;
                width: 100%;
            }
            .price-tag {
                color: #c5a059;
                font-weight: bold;
                font-size: 1.2rem;
            }
        </style>
    </head>
    <body class="bg-light">
        <jsp:include page="navbar.jsp" /> 

        <div class="container my-5 pt-5">
            <h2 class="text-center fw-bold mb-4">Menu <span style="color: #c5a059;">Favorit</span> Kami</h2>

            <div class="row g-4">
                <%
                    // HANYA DEKLARASI SATU KALI DI SINI
                    MenuDAO menuDao = new MenuDAO();
                    List<Menu> dataMenu = menuDao.getAllMenu();

                    if (dataMenu.isEmpty()) {
                        out.print("<div class='col-12 text-center'><p class='text-muted'>Menu belum tersedia.</p></div>");
                    }

                    for (Menu m : dataMenu) {
                %>
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="card h-100 menu-card">
                        <div class="img-container">
                            <img src="assets/img/menu/<%= m.getFoto()%>" class="card-img-top" alt="<%= m.getNama()%>">
                        </div>
                        <div class="card-body">
                            <span class="badge bg-secondary mb-2"><%= m.getKategori()%></span>
                            <h5 class="card-title fw-bold"><%= m.getNama()%></h5>
                            <p class="price-tag">Rp <%= String.format("%,.0f", m.getHarga())%></p>
                            <button class="btn btn-dark w-100 rounded-pill">Pesan Sekarang</button>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>