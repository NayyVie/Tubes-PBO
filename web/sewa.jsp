<%-- 
    Document   : sewa
    Created on : Dec 29, 2025
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sewa Perlengkapan</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }

        /* ===== HEADER ===== */
        header {
            background: #0c6452;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            z-index: 1000;
        }

        header nav a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }

        header nav a:hover {
            text-decoration: underline;
        }

        /* ===== HERO ===== */
        .hero {
            background: #199181;
            color: white;
            text-align: center;
            padding: 60px 20px;
        }

        /* ===== CONTENT ===== */
        .container {
            padding: 50px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
        }

        .card {
            background: white;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
        }

        .card img {
            width: 100%;
            height: 160px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .price {
            font-weight: bold;
            color: #0c6452;
            margin: 10px 0;
        }

        /* ===== QTY ===== */
        .qty-control {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin: 12px 0;
        }

        .qty-btn {
            border: none;
            background: none;
            font-size: 22px;
            font-weight: bold;
            color: #0c6452;
            cursor: pointer;
        }

        .qty-input {
            width: 40px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 4px;
        }

        .btn-add {
            margin-top: 10px;
            padding: 8px 20px;
            background: #0c6452;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 13px;
        }

        .btn-add:hover {
            background: #084a3d;
        }
    </style>
</head>

<body>

<!-- ===== HEADER ===== -->
<header>
    <h2>Veilside Adventure</h2>
    <nav>
        <a href="<%= request.getContextPath() %>/Home">Home</a>
        <a href="<%= request.getContextPath() %>/SewaForm">Sewa</a>
        <a href="<%= request.getContextPath() %>/Login">Login</a>
    </nav>
</header>

<!-- ===== HERO ===== -->
<section class="hero">
    <h1>Sewa Perlengkapan Outdoor</h1>
    <p>Pilih perlengkapan yang kamu butuhkan</p>
</section>

<!-- ===== PRODUCT LIST ===== -->
<section class="container">
    <div class="grid">

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

            if (products == null || products.isEmpty()) {
        %>
            <p style="text-align:center;">Belum ada produk tersedia</p>
        <%
            } else {
                for (Product p : products) {
        %>

        <div class="card">
            <img src="<%= request.getContextPath() %>/images/<%= p.getImage() %>"
                 alt="<%= p.getName() %>">

            <h3><%= p.getName() %></h3>

            <div class="price">
                Rp <%= p.getPrice() %> / hari
            </div>

            <!-- QTY -->
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="decreaseQty(<%= p.getId() %>)">−</button>

                <input type="text"
                       id="qty-<%= p.getId() %>"
                       class="qty-input"
                       value="1"
                       readonly>

                <button type="button" class="qty-btn"
                        onclick="increaseQty(<%= p.getId() %>)">+</button>
            </div>

            <!-- ADD -->
            <form action="<%= request.getContextPath() %>/AddToCart" method="get">
                <input type="hidden" name="product_id" value="<%= p.getId() %>">
                <input type="hidden" name="qty" id="form-qty-<%= p.getId() %>">

                <button type="submit"
                        class="btn-add"
                        onclick="setQty(<%= p.getId() %>)">
                    Tambah
                </button>
            </form>
        </div>

        <%
                }
            }
        %>

    </div>
</section>

<script>
function increaseQty(id) {
    let input = document.getElementById("qty-" + id);
    input.value = parseInt(input.value) + 1;
}

function decreaseQty(id) {
    let input = document.getElementById("qty-" + id);
    let val = parseInt(input.value);
    if (val > 1) input.value = val - 1;
}

function setQty(id) {
    document.getElementById("form-qty-" + id).value =
        document.getElementById("qty-" + id).value;
}
</script>

</body>
</html>
