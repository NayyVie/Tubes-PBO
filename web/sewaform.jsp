<%-- 
    Document   : sewaform
    Created on : Dec 31, 2025, 11:23:24 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Form Penyewaan</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #eaf4f2;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-card {
            background: white;
            width: 420px;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .form-card h2 {
            text-align: center;
            color: #0c6452;
            margin-bottom: 25px;
        }

        .cart-list {
            font-size: 14px;
            margin-bottom: 15px;
        }

        .cart-list ul {
            padding-left: 18px;
        }

        .total {
            font-weight: bold;
            color: #0c6452;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #0c6452;
            color: white;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
        }

        button:hover {
            background: #084a3d;
        }
    </style>
</head>

<body>

<div class="form-card">
    <h2>Form Penyewaan</h2>

    <%
        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
        int total = 0;
    %>

    <div class="cart-list">
    <b>Barang yang Disewa:</b>
    <ul>
        <%
            if (cart != null) {
                for (CartItem item : cart) {
                    int subtotal = item.getPrice() * item.getQty();
                    total += subtotal;
        %>
            <li>
                <%= item.getName() %>
                (x<%= item.getQty() %>)
                - Rp <%= subtotal %>/hari
            </li>
        <%
                }
            }
        %>
    </ul>
</div>

    <div class="total">
        Total per hari: Rp <%= total %>
    </div>

    <!-- ================= FORM ================= -->
    <form method="post" action="<%= request.getContextPath() %>/KonfirmasiSewa">

        <label>Nama Penyewa</label>
        <input type="text" name="penyewa" required>

        <label>Nomor HP Penyewa</label>
        <input type="tel" name="no_hp" placeholder="08xxxxxxxxxx" required>

        <label>Alamat Penyewa</label>
        <textarea name="alamat" rows="3" placeholder="Alamat lengkap" required></textarea>

        <label>Tanggal Mulai Sewa</label>
        <input type="date" name="tanggal_mulai" required>

        <label>Lama Sewa (hari)</label>
        <input type="number" name="lama_sewa" min="1" required>

        <button type="submit">Konfirmasi Sewa</button>
    </form>
</div>

</body>
</html>
