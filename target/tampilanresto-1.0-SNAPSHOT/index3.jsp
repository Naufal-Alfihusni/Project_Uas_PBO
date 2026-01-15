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
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #fdfdfd;
                overflow-x: hidden;
            }

            .navbar {
                backdrop-filter: blur(10px);
                background: rgba(0, 0, 0, 0.85) !important;
            }

            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&q=80&w=2070');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                align-items: center;
                color: white;
            }

            .gold-text {
                color: #ffcc00;
            }

            .stats-bar {
                background: #1a1a1a;
                color: white;
                border-radius: 20px;
                margin-top: -60px;
                border: 1px solid rgba(255, 204, 0, 0.2);
            }

            .btn-warning {
                background-color: #ffcc00;
                transition: 0.3s;
            }

            .btn-warning:hover {
                background-color: #e6b800;
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(255, 204, 0, 0.4);
            }

            .card {
                border-radius: 15px;
            }
        </style>
    </head>
    <body>

        <!-- NAVBAR -->
        <%@include file="navbar.jsp" %>

        <!-- HERO -->
        <header class="hero-section text-center">
            <div class="container">
                <h5 class="text-uppercase gold-text mb-3" style="letter-spacing:5px;">Authentic Indonesian Coffee</h5>
                <h1 class="display-1 fw-bold mb-4" style="font-family:'Playfair Display', serif;">Ngopi.In aja</h1>
                <p class="lead mb-5 mx-auto" style="max-width:600px;">
                    Cita rasa pegunungan Puncak Bogor dalam setiap tetes kopi organik pilihan terbaik.
                </p>
                <a href="daftarMenu.jsp" class="btn btn-warning btn-lg px-5 py-3 rounded-pill fw-bold text-dark shadow">
                    LIHAT MENU
                </a>
            </div>
        </header>

        <!-- ABOUT US -->
        <section id="about" class="py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h6 class="text-uppercase gold-text fw-bold">Tentang Kami</h6>
                        <h2 class="fw-bold mb-4">Ngopi.In aja</h2>
                        <p class="text-muted">
                            Ngopi.In aja adalah kafe kopi lokal dari Bogor yang menyajikan kopi
                            pilihan langsung dari petani lokal Bandung Selatan.
                        </p>
                        <p class="text-muted">
                            Cocok untuk nongkrong, kerja, maupun quality time dengan suasana alam pegunungan.
                        </p>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&q=80&w=900"
                             class="img-fluid rounded-4 shadow">
                    </div>
                </div>
            </div>
        </section>

        <!-- LOKASI -->
        <section id="lokasi" class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-4">
                    <h6 class="text-uppercase gold-text fw-bold">Lokasi</h6>
                    <h2 class="fw-bold">Ngopi.In Ciwidey</h2>
                    <p class="text-muted">Jl. Raya Ciwidey – Rancabali, Bandung</p>
                </div>

                <div class="ratio ratio-16x9 rounded-4 overflow-hidden shadow">
                    <iframe src="https://www.google.com/maps?q=Ciwidey,Bandung&output=embed"
                            loading="lazy"></iframe>
                </div>
            </div>
        </section>

        <!-- BOOKING -->
        <section id="booking" class="py-5">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-md-5 text-center">
                        <h2 class="fw-bold">Booking Tempat</h2>
                        <p class="text-muted mb-4">Pastikan meja Anda tersedia</p>

                        <div class="card shadow p-4">
                            <form action="prosesBooking.jsp" method="POST">
                                <input type="text" name="nama" class="form-control mb-3" placeholder="Nama Lengkap" required>
                                <input type="datetime-local" name="waktu" class="form-control mb-3" required>
                                <button class="btn btn-dark w-100 py-2 fw-bold">Konfirmasi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FOOTER -->
        <footer class="bg-dark text-white text-center py-5">
            <div class="container">
                <h4 class="fw-bold">Ngopi.<span class="gold-text">In</span></h4>
                <div class="my-3">
                    <a href="#" class="text-white mx-2"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white mx-2"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-white mx-2"><i class="fab fa-whatsapp"></i></a>
                </div>
                <p class="small opacity-50">&copy; 2026 Ngopi.In Ciwidey</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>