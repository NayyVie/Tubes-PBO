<%-- 
    Document   : index / home
    Created on : Dec 29, 2025
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Veilside Adventure</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #ffffff;
        }

        /* ===== HEADER ===== */
        header {
            background: #0c6452;
            padding: 15px 40px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo img {
            width: 40px;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        /* ===== HERO ===== */
        .hero {
            background: #199181;
            color: white;
            text-align: center;
            padding: 120px 20px;
        }

        .hero h1 {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 18px;
            max-width: 600px;
            margin: auto;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 25px;
            background: white;
            color: #199181;
            border-radius: 30px;
            font-weight: bold;
            text-decoration: none;
        }

        /* ===== ABOUT US ===== */
        .sectionn {
            padding: 80px 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 40px;
        }

        .sectionn-text {
            max-width: 500px;
        }

        .sectionn-text h1 {
            color: #0c6452;
            font-size: 36px;
        }

        .sectionn-text p {
            line-height: 1.6;
        }

        .sectionn img {
            width: 300px;
        }

        /* ===== SECTION ===== */
        .section {
            padding: 60px 40px;
            text-align: center;
        }

        .section h2 {
            color: #0c6452;
            margin-bottom: 40px;
        }

        /* ===== CARD ===== */
        .cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .card {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-8px);
        }

        .card img {
            width: 100px;
            margin-bottom: 15px;
            transition: transform 0.3s;
        }

        .card:hover img {
            transform: scale(1.1) rotate(3deg);
        }

        /* ===== TESTIMONI ===== */
        .testi {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .testi-card {
            width: 260px;
            padding: 20px;
            border-radius: 12px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            text-align: left;
        }

        /* ===== TESTIMONI AVATAR ===== */
        .testi-card img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .stars {
            color: orange;
        }

        /* ===== CONTACT ===== */
        .contact button {
            padding: 12px 25px;
            background: #0c6452;
            color: white;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
        }

        .contact button:hover {
            background: #084a3d;
        }

        footer {
            background: #0c6452;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 50px;
        }
    </style>
</head>

<body>

<!-- ===== HEADER / NAVBAR ===== -->
<header>
    <div class="logo">
        <img src="images/logo.png" alt="Logo">
        <h3>Veilside Adventure</h3>
    </div>
    <nav>
        <a href="<%= request.getContextPath() %>/Home">Beranda</a>
        <!-- MENU SEWA → FORM SEWA -->
        <a href="<%= request.getContextPath() %>/SewaForm">Sewa</a>
        <a href="<%= request.getContextPath() %>/Login">Login</a>
    </nav>
</header>

<!-- ===== HERO ===== -->
<section class="hero">
    <h1>Teman Setia Petualanganmu!</h1>
    <p>
        Veilside Adventure menyediakan berbagai perlengkapan outdoor
        untuk mendukung camping, hiking, dan petualangan alam kamu.
    </p>
    <!-- TOMBOL HERO → FORM SEWA -->
    <a class="btn" href="<%= request.getContextPath() %>/SewaForm">
        Sewa Sekarang
    </a>
</section>

<!-- ===== ABOUT US ===== -->
<section class="sectionn">
    <div class="sectionn-text">
        <h1>About Us</h1>
        <p>
            Veilside Adventure hadir untuk mendukung para pecinta alam
            dengan layanan sewa perlengkapan outdoor lengkap,
            berkualitas, dan terjangkau.
        </p>
    </div>
    <img src="images/logo.png" alt="Logo">
</section>

<!-- ===== LAYANAN ===== -->
<section class="section">
    <h2>Layanan Kami</h2>
    <div class="cards">
        <div class="card">
            <img src="images/rent.png" alt="Rent">
            <h3>Penyewaan Outdoor</h3>
            <p>
                Sewa tenda, sleeping bag, carrier,
                dan perlengkapan outdoor lainnya.
            </p>
        </div>

        <div class="card">
            <img src="images/adventure.png" alt="Adventure">
            <h3>Guide & Porter</h3>
            <p>
                Layanan guide pendakian dan porter
                profesional & berpengalaman.
            </p>
        </div>
    </div>
</section>

<!-- ===== TESTIMONI ===== -->
<section class="section">
    <h2>Apa Kata Mereka?</h2>
    <div class="testi">
        <div class="testi-card">
            <img src="images/user1.jpg" alt="User">
            <p><b>Hamam Paruk</b></p>
            <p>Rekomendasi tempat sewa outdoor terbaik.</p>
            <div class="stars">★★★★★</div>
        </div>

        <div class="testi-card">
            <img src="images/user2.jpg" alt="User">
            <p><b>Much Panca</b></p>
            <p>Pelayanan ramah dan alat lengkap.</p>
            <div class="stars">★★★★★</div>
        </div>

        <div class="testi-card">
            <img src="images/user3.jpg" alt="User">
            <p><b>Alicia John</b></p>
            <p>Pengalaman sewa yang menyenangkan.</p>
            <div class="stars">★★★★★</div>
        </div>
    </div>
</section>

<!-- ===== CONTACT ===== -->
<section class="section contact">
    <h2>Hubungi Kami</h2>
    <p>Hubungi kami melalui WhatsApp</p>

    <!-- TOMBOL WHATSAPP AKTIF -->
    <a href="https://wa.me/6281459125873?text=Halo%20Veilside%20Adventure,%20saya%20ingin%20bertanya%20tentang%20penyewaan"
       target="_blank">
        <button>Chat via WhatsApp</button>
    </a>
</section>

<footer>
    © 2025 Veilside Adventure
</footer>

</body>
</html>
