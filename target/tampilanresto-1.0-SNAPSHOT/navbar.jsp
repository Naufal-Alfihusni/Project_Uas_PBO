<%-- 
    Document   : navbar
    Created on : 13 Jan 2026, 19.19.29
    Author     : naufa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ngopi.In | Coffee & Comfort</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-gold: #ffcc00;
                --dark-bg: #121212;
                --soft-white: #f8f9fa;
            }

            html {
                scroll-behavior: smooth;
            }

            body {
                font-family: 'Montserrat', sans-serif;
                background-color: var(--soft-white);
                color: #333;
                overflow-x: hidden;
            }

            /* --- Navbar Styling --- */
            .navbar-custom {
                padding: 15px 0;
                transition: all 0.4s ease;
                background: rgba(0, 0, 0, 0.85);
                backdrop-filter: blur(10px);
            }

            .navbar-custom.scrolled {
                padding: 10px 0;
                background: #000;
            }

            .navbar-brand {
                font-family: 'Playfair Display', serif;
                letter-spacing: 1px;
            }

            .gold-text {
                color: var(--primary-gold);
            }

            .nav-link {
                font-weight: 600;
                font-size: 0.9rem;
                letter-spacing: 1px;
                margin: 0 10px;
                transition: 0.3s;
            }

            .nav-link:hover {
                color: var(--primary-gold) !important;
            }

            /* --- Hero Section --- */
            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=2070&auto=format&fit=crop');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: white;
            }

            .hero-title {
                font-family: 'Playfair Display', serif;
                font-size: clamp(2.5rem, 8vw, 4.5rem);
                margin-bottom: 20px;
            }

            /* --- Stats Section --- */
            .stats-bar {
                background: var(--dark-bg);
                color: white;
                border-radius: 30px;
                padding: 50px 20px;
                margin-top: -80px;
                position: relative;
                z-index: 10;
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            }

            .stat-item h3 {
                color: var(--primary-gold);
                font-weight: 700;
            }

            /* --- Sections Styling --- */
            section {
                padding: 80px 0;
            }

            .section-title {
                font-family: 'Playfair Display', serif;
                font-weight: 700;
                margin-bottom: 30px;
            }

            /* --- Footer --- */
            footer {
                background: #000;
                color: #fff;
                padding: 50px 0 20px;
            }

            .social-icons a {
                color: white;
                font-size: 1.5rem;
                margin: 0 15px;
                transition: 0.3s;
            }

            .social-icons a:hover {
                color: var(--primary-gold);
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom px-lg-5">
            <div class="container">
                <a class="navbar-brand fw-bold fs-3" href="index.jsp">
                    Ngopi<span class="gold-text">.In</span>
                </a>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link text-white" href="index.jsp">BERANDA</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="daftarMenu.jsp">MENU</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="index.jsp#about">ABOUT</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="index.jsp#gallery-section">GALLERY</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="index.jsp#team">KEANGGOTAAN</a></li>

                        <% if (session.getAttribute("userName") == null) { %>
                        <li class="nav-item ms-lg-3">
                            <a class="btn btn-outline-warning rounded-pill px-4 shadow-sm" href="login.jsp">LOGIN</a>
                        </li>
                        <% } else { %>
                        <li class="nav-item dropdown ms-lg-3">
                            <a class="btn btn-warning rounded-pill px-4" href="dashboard.jsp" role="button">
                                <i class="fa-solid fa-user-circle me-1"></i> Dashboard
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                                <li><a class="dropdown-item" href="dashboard.jsp">Profil Saya</a></li>
                                <li><a class="dropdown-item" href="pesanan.jsp">Pesanan</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Efek Navbar saat Scroll: Berubah warna background
            window.addEventListener('scroll', function () {
                const nav = document.querySelector('.navbar-custom');
                if (window.scrollY > 50) {
                    nav.classList.add('scrolled', 'shadow');
                } else {
                    nav.classList.remove('scrolled', 'shadow');
                }
            });
        </script>
    </body>
</html>