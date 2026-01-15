<%-- 
    Document   : kasir
    Created on : 14 Jan 2026, 10.04.06
    Author     : naufa
--%>

<%@page import="model.Menu, dao.MenuDAO, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
        <title>Kasir | Ngopi.In</title>
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

        <div class="main-content">
            <div class="row">
                <div class="col-md-8">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 style="font-family: 'Playfair Display', serif;">Daftar Menu</h2>
                        <span class="badge bg-dark rounded-pill px-3 py-2"><i class="bi bi-clock me-2"></i> <%= new java.util.Date()%></span>
                    </div>

                    <div class="row g-3">
                        <%
                            MenuDAO dao = new MenuDAO();
                            List<Menu> listMenu = dao.getAllMenu();
                            for (Menu m : listMenu) {
                        %>
                        <div class="col-md-4">
                            <div class="card menu-card h-100">
                                <img src="assets/img/menu/<%= m.getFoto()%>" class="card-img-top" style="height:140px; object-fit:cover; border-radius: 15px 15px 0 0;">
                                <div class="card-body p-3">
                                    <small class="text-muted"><%= m.getKategori()%></small>
                                    <h6 class="fw-bold mb-1 text-truncate"><%= m.getNama()%></h6>
                                    <p class="text-gold fw-bold mb-3">Rp <%= String.format("%,.0f", m.getHarga())%></p>
                                    <button class="btn btn-add w-100" onclick="addToCart(<%= m.getId()%>, '<%= m.getNama()%>', <%= m.getHarga()%>)">
                                        <i class="bi bi-plus-circle me-2"></i>Tambah
                                    </button>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card cart-container p-4">
                        <div class="cart-header">
                            <h5 class="fw-bold mb-0"><i class="bi bi-bag-check me-2 text-gold"></i>Pesanan Baru</h5>
                        </div>

                        <form action="TransactionServlet" method="POST" class="h-100 d-flex flex-column">
                            <div id="cartItems" class="cart-items-list mt-3">
                                <div class="text-center py-5 text-muted">
                                    <i class="bi bi-cart-x display-4"></i>
                                    <p class="mt-2">Pesanan masih kosong</p>
                                </div>
                            </div>

                            <div class="mt-auto">
                                <div class="total-section">
                                    <div class="d-flex justify-content-between mb-1 small opacity-75">
                                        <span>Subtotal</span>
                                        <span id="displaySubtotal">Rp 0</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold">Total Akhir</span>
                                        <h4 class="fw-bold text-gold mb-0" id="displayTotal">Rp 0</h4>
                                    </div>
                                    <input type="hidden" name="total_akhir" id="inputTotal" value="0">
                                </div>

                                <div class="mt-3">
                                    <label class="small fw-bold mb-2">Metode Pembayaran</label>
                                    <div class="row g-2">
                                        <div class="col-4">
                                            <input type="radio" class="btn-check" name="metode_pembayaran" id="m1" value="CASH" checked>
                                            <label class="btn btn-outline-dark btn-sm w-100" for="m1">CASH</label>
                                        </div>
                                        <div class="col-4">
                                            <input type="radio" class="btn-check" name="metode_pembayaran" id="m2" value="QRIS">
                                            <label class="btn btn-outline-dark btn-sm w-100" for="m2">QRIS</label>
                                        </div>
                                        <div class="col-4">
                                            <input type="radio" class="btn-check" name="metode_pembayaran" id="m3" value="TRANSFER">
                                            <label class="btn btn-outline-dark btn-sm w-100" for="m3">BANK</label>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-warning w-100 py-3 mt-3 fw-bold shadow-sm" style="background: var(--gold); border: none; color: white;">
                                    PROSES TRANSAKSI
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            let cart = [];

            function addToCart(id, nama, harga) {
                const index = cart.findIndex(item => item.id === id);
                if (index > -1) {
                    cart[index].qty++;
                } else {
                    cart.push({id, nama, harga, qty: 1});
                }
                renderCart();
            }

            function updateQty(id, delta) {
                const index = cart.findIndex(item => item.id === id);
                if (index > -1) {
                    cart[index].qty += delta;
                    if (cart[index].qty <= 0) {
                        cart.splice(index, 1);
                    }
                }
                renderCart();
            }

            function formatRupiah(number) {
                return new Intl.NumberFormat('id-ID', {style: 'currency', currency: 'IDR', minimumFractionDigits: 0}).format(number);
            }

            function renderCart() {
                const container = document.getElementById('cartItems');
                let html = '';
                let total = 0;

                if (cart.length === 0) {
                    container.innerHTML = `<div class="text-center py-5 text-muted"><i class="bi bi-cart-x display-4"></i><p class="mt-2">Pesanan masih kosong</p></div>`;
                    document.getElementById('displayTotal').innerText = 'Rp 0';
                    document.getElementById('displaySubtotal').innerText = 'Rp 0';
                    document.getElementById('inputTotal').value = 0;
                    return;
                }

                cart.forEach(item => {
                    const subtotal = item.harga * item.qty;
                    total += subtotal;

                    // Gunakan String Concatenation untuk menghindari masalah EL JSP
                    html += '<div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">' +
                            '<div style="width: 60%">' +
                            '<div class="fw-bold small">' + item.nama + '</div>' +
                            '<div class="text-muted small">' + formatRupiah(item.harga) + '</div>' +
                            '<input type="hidden" name="menu_id[]" value="' + item.id + '">' +
                            '<input type="hidden" name="qty[]" value="' + item.qty + '">' +
                            '<input type="hidden" name="subtotal[]" value="' + subtotal + '">' +
                            '</div>' +
                            '<div class="d-flex align-items-center gap-2">' +
                            '<button type="button" class="qty-btn" onclick="updateQty(' + item.id + ', -1)">-</button>' +
                            '<span class="fw-bold">' + item.qty + '</span>' +
                            '<button type="button" class="qty-btn" onclick="updateQty(' + item.id + ', 1)">+</button>' +
                            '</div>' +
                            '</div>';
                });

                container.innerHTML = html;
                document.getElementById('displayTotal').innerText = formatRupiah(total);
                document.getElementById('displaySubtotal').innerText = formatRupiah(total);
                document.getElementById('inputTotal').value = total;
            }
        </script>
    </body>
</html>