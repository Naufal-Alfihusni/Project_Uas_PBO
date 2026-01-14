<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kopi Ciwidey - Beranda</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'Montserrat', sans-serif; background-color: #fdfdfd; }
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                        url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085');
            background-size: cover; background-position: center;
            height: 100vh; display: flex; align-items: center; color: white;
        }
        .navbar-custom { background: rgba(0,0,0,0.8); transition: 0.3s; }
        .gold-text { color: #ffcc00; }
        .stats-bar { background: #1a1a1a; color: white; border-radius: 20px; padding: 40px 0; }
    </style>
</head>
<body>

    <%@include file="navbar.jsp" %>

    <header class="hero-section">
        <div class="container text-center">
            <h5 class="text-uppercase tracking-widest gold-text mb-3">Authentic Indonesian Coffee</h5>
            <h1 class="display-1 fw-bold mb-4" style="font-family: 'Playfair Display';">Kopi Ciwidey</h1>
            <p class="lead mb-5 mx-auto" style="max-width: 600px;">Cita rasa pegunungan Bandung dalam setiap tetes kopi organik pilihan terbaik untuk hari Anda.</p>
            <a href="daftarMenu.jsp" class="btn btn-warning btn-lg px-5 py-3 rounded-pill fw-bold">LIHAT MENU</a>
        </div>
    </header>

    <div class="container my-5">
        <div class="stats-bar shadow-lg">
            <div class="row text-center g-4">
                <div class="col-md-4">
                    <h2 class="gold-text fw-bold">100%</h2>
                    <p class="small text-uppercase mb-0">Kopi Organik</p>
                </div>
                <div class="col-md-4 border-start border-end border-secondary">
                    <h2 class="gold-text fw-bold">50+</h2>
                    <p class="small text-uppercase mb-0">Petani Lokal</p>
                </div>
                <div class="col-md-4">
                    <h2 class="gold-text fw-bold">08th</h2>
                    <p class="small text-uppercase mb-0">Pengalaman</p>
                </div>
            </div>
        </div>
    </div>

    <section id="booking" class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <h2 class="fw-bold mb-4">Booking Tempat</h2>
                    <div class="card border-0 shadow-sm p-4">
                        <form>
                            <div class="mb-3 text-start">
                                <label class="form-label">Nama Lengkap</label>
                                <input type="text" class="form-control" placeholder="Contoh: Budi Santoso">
                            </div>
                            <div class="mb-3 text-start">
                                <label class="form-label">Tanggal & Waktu</label>
                                <input type="datetime-local" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-dark w-100 py-3 mt-3">Konfirmasi Reservasi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>