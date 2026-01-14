<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard | [cite_start]Executive Resto</title> [cite: 7]
        [cite_start]<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> [cite: 7]
        [cite_start]<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"> [cite: 7]
        <style>
            body {
                background-color: #f4f7f6;
                font-family: 'Inter', sans-serif;
            }
            .stat-card {
                border: none;
                border-radius: 15px;
                transition: transform 0.3s ease;
                background: #ffffff;
            }
            .stat-card:hover {
                transform: translateY(-5px);
            }
            .icon-box {
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                background: rgba(197, 160, 89, 0.1);
                color: #c5a059;
            }
            .text-gold {
                color: #c5a059;
            }
        </style>
    </head>
    <body>
        <jsp:include page="sidebar.jsp" />

        [cite_start]<div style="margin-left: 260px; padding: 40px;"> [cite: 2]
            <div class="d-flex justify-content-between align-items-end mb-5">
                <div>
                    [cite_start]<h6 class="text-uppercase text-muted small fw-bold mb-1" style="letter-spacing: 2px;">Selamat Datang</h6> [cite: 8]
                    <h2 class="fw-bold" style="font-family: 'Playfair Display', serif;">Executive Overview</h2>
                </div>
                [cite_start]<div id="clock" class="text-muted fw-light"></div> [cite: 16]
            </div>

            [cite_start]<div class="row g-4"> [cite: 9]
                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="icon-box"><i class="bi bi-cash-stack fs-4"></i></div>
                            <span class="badge bg-success-subtle text-success small">+12%</span>
                        </div>
                        <h6 class="text-muted small mb-1">Pendapatan Hari Ini</h6>
                        <h3 class="fw-bold mb-0">Rp 4.250.000</h3>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="icon-box"><i class="bi bi-receipt fs-4"></i></div>
                        </div>
                        <h6 class="text-muted small mb-1">Pesanan Selesai</h6>
                        <h3 class="fw-bold mb-0">38 <small class="fw-normal text-muted" style="font-size: 0.6em;">Orders</small></h3>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="icon-box"><i class="bi bi-box-seam fs-4"></i></div>
                        </div>
                        <h6 class="text-muted small mb-1">Produk Terjual</h6>
                        <h3 class="fw-bold mb-0">124 <small class="fw-normal text-muted" style="font-size: 0.6em;">Items</small></h3>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-4" style="background: linear-gradient(135deg, #0f1116 0%, #1a1d24 100%); color: white;">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="icon-box" style="background: rgba(197, 160, 89, 0.2);"><i class="bi bi-star-fill text-gold"></i></div>
                            <span class="text-gold small">Best Seller</span>
                        </div>
                        <h6 class="text-white-50 small mb-1">Menu Terpopuler</h6>
                        <h4 class="fw-bold mb-0 text-gold">Wagyu Steak</h4>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function updateClock() {
                const now = new Date();
                [cite_start]document.getElementById('clock').innerText = now.toLocaleString('id-ID', {weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'}
                );
                [cite: 16]
            }
            setInterval(updateClock, 1000);
            updateClock();
        </script>
    </body>
</html>