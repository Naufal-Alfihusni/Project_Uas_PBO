<%-- 
    Document   : index2
    Created on : 15 Jan 2026, 14.27.33
    Author     : naufa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kopi Ciwidey - Beranda & Gallery</title>

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

            /* Tombol Login di Navbar */
            .nav-login-kuning {
                background-color: #ffcc00;
                color: #000 !important;
                border-radius: 20px;
                padding: 8px 20px !important;
                margin-left: 10px;
                transition: 0.3s;
            }

            .nav-login-kuning:hover {
                background-color: #e6b800;
                transform: scale(1.05);
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

            /* Gallery Style */
            .gallery-img {
                height: 250px;
                width: 100%;
                object-fit: cover;
                border-radius: 15px;
                transition: 0.4s;
                cursor: pointer;
            }

            .gallery-img:hover {
                transform: scale(1.05);
                filter: brightness(80%);
            }

            /* Team Card Style */
            .card {
                border-radius: 15px;
                transition: 0.3s;
                border: none;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 30px rgba(0,0,0,0.1) !important;
            }

            .social-link-icon {
                width: 35px;
                height: 35px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                background: #f8f9fa;
                color: #333;
                text-decoration: none;
                transition: 0.3s;
                border: 1px solid #ddd;
                font-size: 0.9rem;
            }

            .social-link-icon:hover {
                background: #ffcc00;
                color: #000;
                border-color: #ffcc00;
            }
        </style>
    </head>
    <body>

        <!-- NAVBAR -->
        <%@include file="navbar.jsp" %>

        <header class="hero-section text-center">
            <div class="container">
                <h5 class="text-uppercase gold-text mb-3" style="letter-spacing:5px;">Authentic Indonesian Coffee</h5>
                <h1 class="display-1 fw-bold mb-4" style="font-family:'Playfair Display', serif;">Ngopi.In aja</h1>
                <p class="lead mb-5 mx-auto" style="max-width:600px;">
                    Cita rasa pegunungan Puncak Bogor dalam setiap tetes kopi organik pilihan terbaik.
                </p>
                <a href="login.jsp" class="btn btn-warning btn-lg px-5 py-3 rounded-pill fw-bold text-dark shadow">
                    LOGIN 
                </a>
            </div>
        </header>

        <section id="about" class="py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h6 class="text-uppercase gold-text fw-bold">Tentang Kami</h6>
                        <h2 class="fw-bold mb-4">Ngopi.In aja</h2>
                        <p class="text-justify">Berawal dari kecintaan kami terhadap aroma tanah Bogor yang khas setelah hujan, Ngopi.In aja hadir sebagai rumah bagi para penikmat kopi sejati. Kami bukan sekedar kafe, kami adalah penghubung antara dedikasi petani lokal Jawa Barat dengan cangkir Anda.</p>

                        <p class="text-justify">Setiap biji kopi yang kami sajikan dipilih secara teliti melalui proses kuras yang ketat langsung dari perkebunan terbaik di tanah Pasundan. Dengan teknik penyeduhan yang presisi, kami memastikan karakter rasa yang autentik mulai dari sentuhan buah-buahan hingga rasa cokelat yang mendalam tersaji sempurna untuk menemani setiap cerita dan produktivitas Anda.</p>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&q=80&w=900" class="img-fluid rounded-4 shadow">
                    </div>
                </div>
            </div>
        </section>

        <section id="gallery-section" class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h6 class="text-uppercase gold-text fw-bold">Gallery</h6>
                    <h2 class="fw-bold">Suasana Ngopi.In aja</h2>
                    <p class="text-muted">Momen hangat dan racikan kopi autentik kami.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1442512595331-e89e73853f31?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1511920170033-f8396924c348?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1497935586351-b67a49e012bf?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1554118811-1e0d58224f24?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                    <div class="col-md-4 col-6"><img src="https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?auto=format&fit=crop&q=80&w=600" class="gallery-img shadow"></div>
                </div>
            </div>
        </section>

        <section id="team" class="py-5">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h6 class="text-uppercase gold-text fw-bold">Our Team</h6>
                    <h2 class="fw-bold">Keanggotaan Ngopi.In</h2>
                    <p class="text-muted">Orang-orang hebat di balik layar.</p>
                </div>

                <div class="row g-4 justify-content-center">
                    <div class="col-md-4">
                        <div class="card shadow-sm text-center p-4 h-100">
                            <img src="assets/img/foto_profile/dinta.jpeg" class="rounded-circle mx-auto mb-3" style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #ffcc00;">
                            <h6 class="fw-bold mb-1">Dinta Fridayanti</h6>
                            <p class="text-warning small fw-bold">Head Barista</p>
                            <div class="mt-2">
                                <a href="https://www.instagram.com/dnta_fr?igsh=MWZybzdzdTdyaWllaw==" target="_blank" class="social-link-icon me-1"><i class="fab fa-instagram"></i></a>
                                <a href="https://www.tiktok.com/@taa.din?_r=1&_t=ZS-935NlcmbMxD" target="_blank" class="social-link-icon"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card shadow-sm text-center p-4 h-100">
                            <img src="assets/img/foto_profile/aqwam.jpeg" class="rounded-circle mx-auto mb-3" style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #ffcc00;">
                            <h6 class="fw-bold mb-1">Muhammad Aqwam Kamil</h6>
                            <p class="text-warning small fw-bold">Manager</p>
                            <div class="mt-2">
                                <a href="https://www.instagram.com/akmm_yx?igsh=MWZsNjNyODA2NmNuaA%3D%3D&utm_source=qr" target="_blank" class="social-link-icon me-1"><i class="fab fa-instagram"></i></a>
                                <a href="https://www.tiktok.com/@8bitheartbeats?_r=1&_t=ZS-935Npd4oAei" target="_blank" class="social-link-icon"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card shadow-sm text-center p-4 h-100">
                            <img src="assets/img/foto_profile/alfi.JPG" class="rounded-circle mx-auto mb-3" style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #ffcc00;">
                            <h6 class="fw-bold mb-1">Naufal Alfihusni</h6>
                            <p class="text-warning small fw-bold">Roaster</p>
                            <div class="mt-2">
                                <a href="https://www.instagram.com/alfi_1215?igsh=MXJpdDFkYzA5ZThmcQ==" target="_blank" class="social-link-icon me-1"><i class="fab fa-instagram"></i></a>
                                <a href="https://tiktok.com" target="_blank" class="social-link-icon"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card shadow-sm text-center p-4 h-100">
                            <img src="assets/img/foto_profile/syahid.jpeg" class="rounded-circle mx-auto mb-3" style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #ffcc00;">
                            <h6 class="fw-bold mb-1">Syahid Thoriq Abdul Aziz</h6>
                            <p class="text-warning small fw-bold">Pastry Chef</p>
                            <div class="mt-2">
                                <a href="https://www.instagram.com/syahidthoriq2/" target="_blank" class="social-link-icon me-1"><i class="fab fa-instagram"></i></a>
                                <a href="https://tiktok.com" target="_blank" class="social-link-icon"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card shadow-sm text-center p-4 h-100">
                            <img src="assets/img/foto_profile/rizzal.jpeg" class="rounded-circle mx-auto mb-3" style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #ffcc00;">
                            <h6 class="fw-bold mb-1">Mohammad Rizzal</h6>
                            <p class="text-warning small fw-bold">Server</p>
                            <div class="mt-2">
                                <a href="https://www.instagram.com/itsmezall.__?igsh=MTZqZjJwY2RlY3U2NQ==" target="_blank" class="social-link-icon me-1"><i class="fab fa-instagram"></i></a>
                                <a href="https://www.tiktok.com/@mikonovaa?is_from_webapp=1&sender_device=pc" target="_blank" class="social-link-icon"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="bg-dark text-white text-center py-5">
            <div class="container">
                <h4 class="fw-bold">Ngopi.<span class="gold-text">In aja</span></h4>
                <div class="my-3">
                    <a href="#" class="text-white mx-2"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white mx-2"><i class="fab fa-tiktok"></i></a>
                    <a href="#" class="text-white mx-2"><i class="fab fa-whatsapp"></i></a>
                </div>
                <p class="small opacity-50">© 2026 Ngopi.In aja</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
