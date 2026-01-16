<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="dao.MenuDAO"%>
<%@page import="dao.TransactionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Cek Login
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 2. Siapkan Formatter Rupiah
    Locale localeID = new Locale("id", "ID");
    NumberFormat formatRp = NumberFormat.getCurrencyInstance(localeID);
    SimpleDateFormat formatTanggal = new SimpleDateFormat("dd MMM yyyy, HH:mm");

    // 3. Ambil Data dari Database
    TransactionDAO tDao = new TransactionDAO();
    MenuDAO mDao = new MenuDAO();

    double totalPendapatan = tDao.getTotalPendapatan();
    int totalTransaksi = tDao.getTotalTransaksi();
    int totalMenu = mDao.getMenuCount();
    List<Transaction> recentTrans = tDao.getRecentTransactions(5); // Ambil 5 terbaru
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard | Ngopi.In</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

        <style>
            /*            :root {
                            --gold: #c5a059;
                            --gold-dark: #b08d45;
                            --dark-bg: #0f1116;
                            --soft-dark: #1a1d24;
                            --text-grey: #a0a0a0;
                        }
                        body {
                            background-color: #f4f7f6;
                            font-family: 'Poppins', sans-serif;
                        }
                        
                         Kartu Statistik 
                        .stat-card {
                            border: none;
                            border-radius: 15px;
                            background: white;
                            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
                            transition: transform 0.3s ease;
                            overflow: hidden;
                        }
                        .stat-card:hover {
                            transform: translateY(-5px);
                        }
                        .stat-icon {
                            width: 50px;
                            height: 50px;
                            border-radius: 12px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.5rem;
                        }
                        
                         Warna Khusus Kartu 
                        .bg-gold-soft { background-color: rgba(197, 160, 89, 0.15); color: var(--gold-dark); }
                        .bg-blue-soft { background-color: rgba(13, 110, 253, 0.15); color: #0d6efd; }
                        .bg-green-soft { background-color: rgba(25, 135, 84, 0.15); color: #198754; }
            
                         Tabel Riwayat 
                        .table-card {
                            background: white;
                            border-radius: 15px;
                            border: none;
                            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
                        }
                        .table-custom thead th {
                            background-color: var(--soft-dark);
                            color: var(--gold);
                            border: none;
                            padding: 15px;
                            font-weight: 500;
                        }
                        .table-custom tbody td {
                            padding: 15px;
                            vertical-align: middle;
                            border-bottom: 1px solid #eee;
                        }
                        .badge-method {
                            background-color: #f8f9fa;
                            border: 1px solid #ddd;
                            color: #555;
                            padding: 5px 10px;
                            border-radius: 50px;
                            font-size: 0.8rem;
                        }*/
            :root {
                --gold: #c5a059;
                --dark-bg: #0f1116;
                --soft-dark: #1a1d24;
            }
            body {
                background-color: #f8f9fa;
            }
            .active-gold {
                background-color: var(--gold) !important;
                color: white !important;
                font-weight: 600;
                box-shadow: 0 4px 15px rgba(197, 160, 89, 0.3);
            }
            .hover-effect:hover {
                background-color: rgba(255, 255, 255, 0.1);
                color: var(--gold) !important;
            }

            .main-content {
                margin-left: 260px;
                padding: 30px;
            }
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }

            /* Menu Styling */
            .menu-card {
                transition: all 0.3s ease;
                cursor: pointer;
                border: 1px solid transparent;
            }
            .menu-card:hover {
                transform: translateY(-5px);
                border-color: var(--gold);
            }
            .btn-add {
                background: var(--dark-bg);
                color: white;
                border-radius: 50px;
                font-size: 0.8rem;
            }
            .btn-add:hover {
                background: var(--gold);
                color: white;
            }

            /* Cart Styling */
            .cart-container {
                position: sticky;
                top: 20px;
                background: white;
                height: calc(100vh - 40px);
                display: flex;
                flex-column: column;
            }
            .cart-header {
                border-bottom: 2px solid #f1f1f1;
                padding-bottom: 15px;
            }
            .cart-items-list {
                flex-grow: 1;
                overflow-y: auto;
                padding-right: 5px;
            }

            .qty-btn {
                width: 28px;
                height: 28px;
                border-radius: 50%;
                border: 1px solid #ddd;
                background: white;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: 0.2s;
                font-weight: bold;
            }
            .qty-btn:hover {
                background: var(--gold);
                color: white;
                border-color: var(--gold);
            }

            .total-section {
                background: var(--dark-bg);
                color: white;
                border-radius: 12px;
                padding: 20px;
                margin-top: 15px;
            }
            .text-gold {
                color: var(--gold);
            }
        </style>
    </head>
    <body>

        <jsp:include page="sidebar.jsp" />

        <div class="content-wrapper" style="margin-left: 260px; padding: 30px;">

            <div class="d-flex justify-content-between align-items-center mb-5">
                <div>
                    <h2 class="fw-bold text-dark" style="font-family: 'Playfair Display', serif;">Dashboard Overview</h2>
                    <p class="text-muted m-0">Halo <%= session.getAttribute("userName")%>, inilah ringkasan restoran hari ini.</p>
                </div>
                <div class="text-end text-muted small">
                    <i class="bi bi-calendar3 me-2"></i>
                    <%= new java.text.SimpleDateFormat("EEEE, dd MMMM yyyy", new Locale("id", "ID")).format(new java.util.Date())%>
                </div>
            </div>

            <div class="row g-4 mb-5">

                <div class="col-md-4">
                    <div class="card stat-card p-4">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted text-uppercase small fw-bold mb-2">Total Pendapatan</h6>
                                <h3 class="fw-bold mb-0" style="color: var(--dark-bg);">
                                    <%= formatRp.format(totalPendapatan)%>
                                </h3>
                            </div>
                            <div class="stat-icon bg-gold-soft">
                                <i class="bi bi-wallet2"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card stat-card p-4">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted text-uppercase small fw-bold mb-2">Total Transaksi</h6>
                                <h3 class="fw-bold mb-0 text-dark"><%= totalTransaksi%> <span class="fs-6 text-muted fw-normal">Order</span></h3>
                            </div>
                            <div class="stat-icon bg-blue-soft">
                                <i class="bi bi-receipt"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card stat-card p-4">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted text-uppercase small fw-bold mb-2">Total Menu Aktif</h6>
                                <h3 class="fw-bold mb-0 text-dark"><%= totalMenu%> <span class="fs-6 text-muted fw-normal">Items</span></h3>
                            </div>
                            <div class="stat-icon bg-green-soft">
                                <i class="bi bi-cup-hot"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card table-card p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="fw-bold m-0 text-dark">Riwayat Transaksi Terbaru</h5>
                            <a href="riwayat.jsp" class="btn btn-sm btn-outline-dark rounded-pill px-3">Lihat Semua</a>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-custom table-hover m-0">
                                <thead>
                                    <tr>
                                        <th class="rounded-start">ID Transaksi</th>
                                        <th>Tanggal & Waktu</th>
                                        <th>Metode Pembayaran</th>
                                        <th class="text-end rounded-end">Total Bayar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (recentTrans != null && !recentTrans.isEmpty()) {
                                            for (Transaction t : recentTrans) {
                                    %>
                                    <tr>
                                        <td>
                                            <span class="fw-bold text-dark">#TRX-<%= t.getId()%></span>
                                        </td>
                                        <td class="text-secondary">
                                            <i class="bi bi-clock me-2"></i>
                                            <%= t.getTanggal() != null ? formatTanggal.format(t.getTanggal()) : "-"%>
                                        </td>
                                        <td>
                                            <span class="badge-method text-uppercase">
                                                <%= t.getMetodePembayaran()%>
                                            </span>
                                        </td>
                                        <td class="text-end fw-bold" style="color: var(--gold-dark);">
                                            <%= formatRp.format(t.getTotalAkhir())%>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="4" class="text-center py-4 text-muted">Belum ada transaksi hari ini.</td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>