<%-- 
    Document   : riwayat
    Created on : 14 Jan 2026, 12.40.07
    Author     : naufa
--%>

<%@page import="java.util.List"%>
<%@page import="dao.TransactionDAO"%>
<%@page import="model.Transaction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Cek Session Login
    String role = (String) session.getAttribute("userRole");
    if (role == null || (!role.equalsIgnoreCase("admin") && !role.equalsIgnoreCase("kasir"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Riwayat Transaksi | THE GRAND</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
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
            .content-area {
                margin-left: 260px; /* Sesuaikan dengan lebar sidebar */
                padding: 30px;
            }
            .card-custom {
                border: none;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.05);
                overflow: hidden;
            }
            .table-head-gold {
                background-color: var(--soft-dark);
                color: var(--gold);
            }
        </style>
    </head>
    <body>

        <jsp:include page="sidebar.jsp" />

        <div class="content-area">
            <div class="container-fluid">

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 style="font-family: 'Playfair Display', serif; color: var(--soft-dark);">Data Transaksi</h2>
                        <p class="text-muted small">Laporan penjualan terkini</p>
                    </div>
                </div>

                <div class="card card-custom bg-white">
                    <div class="card-body p-0">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="table-head-gold">
                                <tr>
                                    <th class="py-3 px-4">No Transaksi</th>
                                    <th>Tanggal & Waktu</th>
                                    <th>Total Pembayaran</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    TransactionDAO dao = new TransactionDAO();
                                    // Panggil method yang baru saja kita buat di langkah 1
                                    List<Transaction> list = dao.getAllTransactions();
                                    if (list.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="4" class="text-center py-5 text-muted">Belum ada data transaksi.</td>
                                </tr>
                                <% } else {
                                    for (Transaction t : list) {
                                %>
                                <tr>
                                    <td class="px-4 fw-bold">#<%= t.getId()%></td>
                                    <td>
                                        <i class="bi bi-calendar3 me-2 text-muted"></i>
                                        <%= t.getTanggal()%>
                                    </td>
                                    <td class="fw-bold" style="color: var(--soft-dark);">
                                        Rp <%= String.format("%,.0f", t.getTotalAkhir())%>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-outline-dark rounded-pill px-3" 
                                                onclick="showDetail(<%= t.getId()%>)">
                                            <i class="bi bi-eye me-1"></i> Detail
                                        </button>
                                    </td>
                                </tr>
                                <%   }
                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="detailModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white">
                        <h5 class="modal-title" style="color: var(--gold);">
                            Detail Transaksi #<span id="modalTransId"></span>
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-sm table-borderless">
                            <thead class="border-bottom">
                                <tr>
                                    <th>Menu</th>
                                    <th class="text-center">Qty</th>
                                    <th class="text-end">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody id="modalContent">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Tutup</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                    function showDetail(transId) {
                                                        document.getElementById('modalTransId').innerText = transId;
                                                        var myModal = new bootstrap.Modal(document.getElementById('detailModal'));
                                                        myModal.show();

                                                        const contentBody = document.getElementById('modalContent');
                                                        contentBody.innerHTML = '<tr><td colspan="3" class="text-center py-3">Mengambil data...</td></tr>';

                                                        // Panggil Servlet AJAX
                                                        fetch('DetailTransaksiServlet?id=' + transId)
                                                                .then(response => response.text())
                                                                .then(html => {
                                                                    contentBody.innerHTML = html;
                                                                })
                                                                .catch(error => {
                                                                    console.error('Error:', error);
                                                                    contentBody.innerHTML = '<tr><td colspan="3" class="text-center text-danger">Gagal memuat detail.</td></tr>';
                                                                });
                                                    }
        </script>
    </body>
</html>
