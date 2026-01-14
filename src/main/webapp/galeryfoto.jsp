<%-- 
    Document   : galeryfoto
    Created on : 13 Jan 2026, 14.19.29
    Author     : Akmm_mz
--%>

<<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visual Feast - Gallery</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            /* CSS LANGSUNG DI DALAM FILE */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                background-color: #fdfdfd;
                padding: 40px 5%;
            }

            .header {
                text-align: center;
                margin-bottom: 50px;
            }

            .header h1 {
                font-size: 2.5rem;
                color: #1a1a1a;
                text-transform: uppercase;
                letter-spacing: 3px;
            }

            .header p {
                color: #666;
                margin-top: 10px;
            }

            /* Grid Layout */
            .gallery-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                grid-auto-rows: 250px;
                grid-auto-flow: dense;
                gap: 15px;
            }

            .gallery-item {
                position: relative;
                overflow: hidden;
                border-radius: 12px;
                cursor: pointer;
            }

            /* Span untuk variasi ukuran (Visual Feast) */
            .large {
                grid-column: span 2;
                grid-row: span 2;
            }
            .tall {
                grid-row: span 2;
            }

            .gallery-item img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.6s cubic-bezier(0.25, 1, 0.5, 1);
            }

            /* Overlay Text */
            .overlay {
                position: absolute;
                inset: 0;
                background: rgba(0, 0, 0, 0.5);
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .overlay span {
                color: #fff;
                padding: 8px 16px;
                border: 1px solid #fff;
                text-transform: uppercase;
                font-size: 0.9rem;
                letter-spacing: 1px;
            }

            .gallery-item:hover img {
                transform: scale(1.1);
            }

            .gallery-item:hover .overlay {
                opacity: 1;
            }

            /* LIGHTBOX STYLE */
            #lightbox {
                position: fixed;
                z-index: 1000;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.9);
                display: none; /* Sembunyi secara default */
                align-items: center;
                justify-content: center;
            }

            #lightbox img {
                max-width: 90%;
                max-height: 80%;
                box-shadow: 0 0 20px rgba(0,0,0,0.5);
                border-radius: 5px;
            }

            #lightbox:target {
                display: flex;
            }

            .close-lightbox {
                position: absolute;
                top: 20px;
                right: 30px;
                color: white;
                font-size: 40px;
                text-decoration: none;
            }

            /* Responsive Mobile */
            @media (max-width: 768px) {
                .large, .tall {
                    grid-column: span 1;
                    grid-row: span 1;
                }
                .gallery-grid {
                    grid-auto-rows: 200px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>

        <div class="header">
            <h1>Visual Feast</h1>
            <p>Rasa, Suasana, dan Cerita dalam Satu Bingkai</p>
        </div>

        <div class="gallery-grid">
            <div class="gallery-item large" onclick="openLightbox('https://images.unsplash.com/photo-1504674900247-0877df9cc836')">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836" alt="Food">
                <div class="overlay"><span>Signature Dish</span></div>
            </div>

            <div class="gallery-item" onclick="openLightbox('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4')">
                <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4" alt="Social">
                <div class="overlay"><span>Our Guests</span></div>
            </div>

            <div class="gallery-item tall" onclick="openLightbox('https://images.unsplash.com/photo-1555396273-367ea4eb4db5')">
                <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5" alt="Exterior">
                <div class="overlay"><span>The Venue</span></div>
            </div>

            <div class="gallery-item" onclick="openLightbox('https://images.unsplash.com/photo-1476224483446-e71358189531')">
                <img src="https://images.unsplash.com/photo-1476224483446-e71358189531" alt="Dessert">
                <div class="overlay"><span>Sweet Moments</span></div>
            </div>

            <div class="gallery-item" onclick="openLightbox('https://images.unsplash.com/photo-1528605248644-14dd04022da1')">
                <img src="https://images.unsplash.com/photo-1528605248644-14dd04022da1" alt="People">
                <div class="overlay"><span>Vibe</span></div>
            </div>
        </div>

        <div id="lightbox">
            <a href="#" class="close-lightbox">&times;</a>
            <img id="lightbox-img" src="" alt="Popup">
        </div>

        <script>
            // Fungsi untuk membuka Lightbox
            function openLightbox(src) {
                document.getElementById('lightbox-img').src = src;
                document.getElementById('lightbox').style.display = 'flex';
            }

            // Menutup lightbox jika area hitam diklik
            document.getElementById('lightbox').addEventListener('click', function (e) {
                if (e.target !== document.getElementById('lightbox-img')) {
                    this.style.display = 'none';
                }
            });
        </script>

    </body>
</html>