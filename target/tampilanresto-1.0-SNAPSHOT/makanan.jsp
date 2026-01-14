<%-- 
    Document   : makanan
    Created on : 30 Dec 2025, 14.09.58
    Author     : Akmm_mz
--%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Resto - Keranjang & Struk</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root { --kuning: #ffc107; --bg-light: #fdfdfd; }
        html { scroll-behavior: smooth; }
        body { background-color: #f4f4f4; font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; }

        /* Navigasi */
        .categories-bar { 
            position: sticky; top: 0; background: white; z-index: 1000; 
            padding: 15px 0; box-shadow: 0 2px 10px rgba(0,0,0,0.05); 
        }

        /* Grid Layout */
        .menu-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); 
            gap: 20px; 
            padding: 10px;
        }

        /* Styling Kartu sesuai Gambar */
        .food-card { 
            background: white; 
            border-radius: 25px; /* Sangat melengkung sesuai gambar */
            padding: 15px; 
            border: none; 
            box-shadow: 0 10px 20px rgba(0,0,0,0.05); 
            transition: 0.3s;
            position: relative;
        }
        .food-card:hover { transform: translateY(-5px); }
        
        .food-img { 
            width: 100%; 
            height: 150px; 
            object-fit: cover; 
            border-radius: 20px; /* Melengkung di dalam */
            margin-bottom: 12px;
        }

        .food-title { font-weight: 600; color: #333; margin-bottom: 2px; font-size: 1.1rem; }
        .food-price { color: var(--kuning); font-weight: 700; font-size: 1rem; margin-bottom: 0; }

        /* Tombol Tambah Kuning di Pojok */
        .add-btn { 
            position: absolute; 
            bottom: 15px; 
            right: 15px; 
            background: var(--kuning); 
            border: none; 
            border-radius: 10px; 
            width: 35px; 
            height: 35px; 
            color: white;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.2s;
        }
        .add-btn:active { transform: scale(0.9); }

        /* Floating Cart */
        .cart-floating {
            position: fixed; bottom: 30px; right: 30px; background: var(--kuning);
            color: white; padding: 15px 25px; border-radius: 50px; cursor: pointer;
            box-shadow: 0 10px 30px rgba(255, 193, 7, 0.4); z-index: 1050;
            display: flex; align-items: center; text-decoration: none; font-weight: bold;
        }

        /* Struk Design */
        .receipt-dashed { border-top: 2px dashed #ddd; margin: 15px 0; }
    </style>
</head>
<body id="dashboard-page">

    <div class="categories-bar mb-4">
        <div class="container text-center">
            <a href="#dashboard-page" class="btn btn-warning rounded-pill px-4 fw-bold shadow-sm">Semua</a>
            <a href="#kategori-makanan" class="btn btn-white border rounded-pill px-4 ms-2 shadow-sm">Makanan</a>
            <a href="#kategori-minuman" class="btn btn-white border rounded-pill px-4 ms-2 shadow-sm">Minuman</a>
        </div>
    </div>

    <div class="container pb-5">
        <h4 id="kategori-makanan" class="mb-4"><i class="fas fa-utensils text-warning"></i> Menu Utama</h4>
        
        <div class="menu-grid">
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400" class="food-img">
                <div class="food-title">Salmon Salad</div>
                <p class="food-price">Rp 45.000</p>
                <button class="add-btn" onclick="addToCart('Salmon Salad', 45000)">+</button>
            </div>

            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400" class="food-img">
                <div class="food-title">Pizza Margarita</div>
                <p class="food-price">Rp 45.000</p>
                <button class="add-btn" onclick="addToCart('Pizza Margarita', 45000)">+</button>
            </div>

            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 65.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger XL', 65000)">+</button>
            </div>

            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400" class="food-img">
                <div class="food-title">Beef Burger</div>
                <p class="food-price">Rp 55.000</p>
                <button class="add-btn" onclick="addToCart('Beef Burger Regular', 55000)">+</button>
            </div>
        </div>

        <h4 id="kategori-minuman" class="mb-4 mt-5"><i class="fas fa-glass-whiskey text-warning"></i> Minuman</h4>
        <div class="menu-grid">
            <div class="food-card">
                <img src="https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=400" class="food-img">
                <div class="food-title">Iced Coffee</div>
                <p class="food-price">Rp 25.000</p>
                <button class="add-btn" onclick="addToCart('Iced Coffee', 25000)">+</button>
            </div>
        </div>
    </div>

    <div class="cart-floating" data-bs-toggle="modal" data-bs-target="#cartModal">
        <i class="fas fa-shopping-cart"></i>
        <span class="ms-2">Keranjang</span>
        <span class="badge bg-white text-dark ms-2" id="cart-count">0</span>
    </div>

    <div class="modal fade" id="cartModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0" style="border-radius: 20px;">
                <div class="modal-header border-0 bg-warning" style="border-radius: 20px 20px 0 0;">
                    <h5 class="modal-title fw-bold text-white">Detail Pesanan</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="cart-items-list"></div>
                    <div class="d-flex justify-content-between fw-bold fs-5 mt-3">
                        <span>Total:</span>
                        <span class="text-warning">Rp <span id="total-harga">0</span></span>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button class="btn btn-warning w-100 fw-bold py-3 text-white" style="border-radius: 15px;" onclick="checkout()">BAYAR SEKARANG</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="receiptModal" tabindex="-1">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <i class="fas fa-check-circle text-success fs-1 mb-3"></i>
                    <h5 class="fw-bold">PEMBAYARAN BERHASIL</h5>
                    <p class="small text-muted mb-0" id="receipt-date"></p>
                    <div class="receipt-dashed"></div>
                    <div id="receipt-list" class="text-start mb-3"></div>
                    <div class="receipt-dashed"></div>
                    <div class="d-flex justify-content-between fw-bold fs-5">
                        <span>TOTAL</span>
                        <span id="receipt-total"></span>
                    </div>
                    <button class="btn btn-dark w-100 mt-4" onclick="location.reload()">Selesai</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let cart = [];

        function addToCart(nama, harga) {
            cart.push({ nama, harga });
            updateCart();
        }

        function updateCart() {
            document.getElementById('cart-count').innerText = cart.length;
            const list = document.getElementById('cart-items-list');
            let total = 0;
            let html = cart.length ? "" : "<p class='text-center text-muted'>Kosong</p>";
            
            cart.forEach((item, i) => {
                total += item.harga;
                html += `<div class="d-flex justify-content-between mb-2">
                    <span>${item.nama}</span>
                    <span class="fw-bold">Rp ${item.harga.toLocaleString()}</span>
                </div>`;
            });
            
            list.innerHTML = html;
            document.getElementById('total-harga').innerText = total.toLocaleString();
        }

        function checkout() {
            if(!cart.length) return;
            const now = new Date();
            let total = 0;
            let listHtml = "";
            
            cart.forEach(item => {
                total += item.harga;
                listHtml += `<div class="d-flex justify-content-between small"><span>${item.nama}</span><span>${item.harga.toLocaleString()}</span></div>`;
            });

            document.getElementById('receipt-date').innerText = now.toLocaleString();
            document.getElementById('receipt-list').innerHTML = listHtml;
            document.getElementById('receipt-total').innerText = "Rp " + total.toLocaleString();

            bootstrap.Modal.getInstance(document.getElementById('cartModal')).hide();
            new bootstrap.Modal(document.getElementById('receiptModal')).show();
        }
    </script>
</body>
</html>