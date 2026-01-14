<%@page pageEncoding="UTF-8"%>
<%
    String currentPath = request.getRequestURI();
    String userRole = (String) session.getAttribute("userRole");
%>

<div class="sidebar d-flex flex-column flex-shrink-0 p-3" 
     style="width: 260px; height: 100vh; position: fixed; background: #0f1116; border-right: 1px solid #2d2d2d; z-index: 1000;">

    <div class="text-center mb-4 mt-2">
        <h3 style="font-family: 'Playfair Display', serif; color: #c5a059; letter-spacing: 2px;">THE GRAND</h3>
        <p class="small text-uppercase opacity-50 text-white" style="font-size: 10px; letter-spacing: 3px;">Resto & Lounge</p>
    </div>

    <ul class="nav nav-pills flex-column mb-auto gap-1">
        <li class="nav-item">
            <a href="dashboard.jsp" class="nav-link text-white py-3 px-4 d-flex align-items-center rounded-3 mb-1 <%= currentPath.contains("dashboard") ? "active-gold" : "hover-effect"%>">
                <i class="bi bi-speedometer2 me-3"></i> Dashboard
            </a>
        </li>
        <% if ("admin".equalsIgnoreCase(userRole)) {%>
        <li>
            <a href="datamenu.jsp" class="nav-link text-white py-3 px-4 d-flex align-items-center rounded-3 mb-1 <%= currentPath.contains("data-menu") ? "active-gold" : "hover-effect"%>">
                <i class="bi bi-journal-richtext me-3"></i> Manajemen Menu
            </a>
        </li>
        <% }%>
        <li>
            <a href="kasir.jsp" class="nav-link text-white py-3 px-4 d-flex align-items-center rounded-3 mb-1 <%= currentPath.contains("kasir") ? "active-gold" : "hover-effect"%>">
                <i class="bi bi-cart-check me-3"></i> Kasir POS
            </a>
        </li>
        <li>
            <a href="riwayat.jsp" class="nav-link text-white py-3 px-4 d-flex align-items-center rounded-3 mb-1 <%= currentPath.contains("riwayat") ? "active-gold" : "hover-effect"%>">
                <i class="bi bi-clock-history me-3"></i> Riwayat Transaksi
            </a>
        </li>
    </ul>

    <div class="mt-auto border-top border-secondary pt-3 opacity-90">
        <a href="LogoutServlet" class="nav-link text-danger py-2 px-4 d-flex align-items-center">
            <i class="bi bi-box-arrow-left me-3"></i> Keluar
        </a>
    </div>
</div>