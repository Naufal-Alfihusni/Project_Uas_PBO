<%-- 
    Document   : navbar
    Created on : 13 Jan 2026, 19.19.29
    Author     : naufa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #fdfdfd;
            }
            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                    url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                align-items: center;
                color: white;
            }
            .navbar-custom {
                background: rgba(0,0,0,0.8);
                transition: 0.3s;
            }
            .gold-text {
                color: #ffcc00;
            }
            .stats-bar {
                background: #1a1a1a;
                color: white;
                border-radius: 20px;
                padding: 40px 0;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom px-lg-5">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold fs-3" href="index.jsp">Kopi <span class="gold-text">Ciwidey</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link px-3 text-white" href="index.jsp">BERANDA</a></li>
                        <li class="nav-item"><a class="nav-link px-3 text-white" href="daftarMenu.jsp">MENU</a></li>
                        <li class="nav-item"><a class="nav-link px-3 text-white" href="#booking">BOOKING</a></li>
                            <% if (session.getAttribute("userName") == null) { %>
                        <li class="nav-item ms-lg-3"><a class="btn btn-outline-warning px-4" href="login.jsp">LOGIN</a></li>
                            <% } else { %>
                        <li class="nav-item ms-lg-3"><a class="btn btn-warning px-4" href="dashboard.jsp">DASHBOARD</a></li>
                            <% }%>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
