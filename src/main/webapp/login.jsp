<%-- 
    Document   : login
    Created on : 30 Dec 2025, 13.18.13
    Author     : naufa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Staff | Ngopi.In</title>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;1,600&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

        <style>
            :root {
                --gold: #c5a059;
                --dark-bg: #1a1a1a;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }

            .glass-card {
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(15px);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 20px;
                padding: 3rem;
                width: 100%;
                max-width: 450px;
                box-shadow: 0 25px 50px rgba(0,0,0,0.5);
                color: white;
            }

            .resto-logo {
                font-family: 'Playfair Display', serif;
                font-size: 2.5rem;
                color: var(--gold);
                letter-spacing: 2px;
                margin-bottom: 0.5rem;
            }

            .sub-title {
                font-weight: 300;
                letter-spacing: 3px;
                text-transform: uppercase;
                font-size: 0.8rem;
                opacity: 0.8;
                margin-bottom: 2.5rem;
            }

            .form-control {
                background: rgba(255, 255, 255, 0.1);
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                color: white;
                padding: 0.8rem 1.2rem;
                margin-bottom: 1.5rem;
                transition: 0.3s;
            }

            .form-control:focus {
                background: rgba(255, 255, 255, 0.15);
                border-color: var(--gold);
                box-shadow: none;
                color: white;
            }

            .form-control::placeholder {
                color: rgba(255, 255, 255, 0.5);
            }

            .btn-login {
                background: var(--gold);
                border: none;
                color: #fff;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: 2px;
                padding: 0.8rem;
                border-radius: 10px;
                width: 100%;
                transition: 0.4s;
                margin-top: 1rem;
            }

            .btn-login:hover {
                background: #b38f4d;
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(197, 160, 89, 0.3);
            }

            .alert-custom {
                background: rgba(220, 53, 69, 0.2);
                border: 1px solid #dc3545;
                color: #ff8c94;
                font-size: 0.9rem;
                border-radius: 10px;
                margin-bottom: 1.5rem;
            }

            .footer-text {
                font-size: 0.75rem;
                opacity: 0.5;
                margin-top: 2rem;
            }
        </style>
    </head>
    <body>

        <div class="glass-card text-center">
            <div class="resto-logo">Ngopi.In</div>
            <div class="sub-title">Authentic Indonesian Coffee</div>

            <%-- Pesan Error --%>
            <%
                String err = request.getParameter("error");
                if ("invalid".equals(err)) {
            %>
            <div class="alert alert-custom py-2">
                <i class="bi bi-exclamation-circle me-2"></i> Kredensial tidak valid
            </div>
            <% } else if ("db".equals(err)) { %>
            <div class="alert alert-custom py-2">
                <i class="bi bi-hdd-network me-2"></i> Gangguan sistem pusat
            </div>
            <% }%>

            <form action="LoginServlet" method="POST">
                <div class="text-start mb-1 px-1">
                    <label class="small opacity-75 mb-1">Username</label>
                </div>
                <input type="text" name="username" class="form-control" placeholder="Masukkan ID Staff" required>

                <div class="text-start mb-1 px-1">
                    <label class="small opacity-75 mb-1">Password</label>
                </div>
                <input type="password" name="password" class="form-control" placeholder="••••••••" required>

                <button type="submit" class="btn btn-login">
                    Masuk ke Sistem <i class="bi bi-arrow-right ms-2"></i>
                </button>
            </form>

            <div class="footer-text">
                &copy; 2026 Ngopi.In Management. Secured Access.
            </div>
        </div>

    </body>
</html>