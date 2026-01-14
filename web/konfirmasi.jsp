<%-- 
    Document   : konfirmasi
    Created on : Jan 2, 2026, 5:52:38 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>Konfirmasi Sewa</title>

    <style>
        body {
            background:#eaf4f2;
            font-family:Arial;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .box {
            background:white;
            width:480px;
            padding:30px;
            border-radius:14px;
            box-shadow:0 10px 30px rgba(0,0,0,.1);
        }

        h2 {
            text-align:center;
            color:#0c6452;
            margin-bottom:20px;
        }

        .section {
            font-size:14px;
            margin-bottom:15px;
        }

        .total {
            font-weight:bold;
            color:#0c6452;
            margin-bottom:15px;
        }

        .pay-box {
            display:none;
            text-align:center;
            margin-top:15px;
        }

        .pay-box img {
            width:200px;
            margin:10px 0;
        }

        button {
            width:100%;
            padding:12px;
            background:#0c6452;
            color:white;
            border:none;
            border-radius:25px;
            font-weight:bold;
            cursor:pointer;
            margin-top:10px;
        }

        button:hover {
            background:#084a3d;
        }
    </style>

    <script>
        function pilihPembayaran(metode) {
            if (metode === 'QRIS') {
                document.getElementById('qrisBox').style.display = 'block';
                document.getElementById('submitBtn').style.display = 'none';
            } else {
                document.getElementById('qrisBox').style.display = 'none';
                document.getElementById('submitBtn').style.display = 'block';
            }
        }
    </script>
</head>

<body>

<div class="box">
    <h2>Konfirmasi Penyewaan</h2>

    <div class="section">
    <b>Barang Disewa:</b>
    <ul>
        <%
            List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
            if (cart != null) {
                for (CartItem item : cart) {
        %>
            <li><%= item.getName() %> (x<%= item.getQty() %>)</li>
        <%
                }
            }
        %>
    </ul>
</div>

    <div class="section">
        <b>Nama:</b> <%= request.getAttribute("nama") %><br>
        <b>No HP:</b> <%= request.getAttribute("noHp") %><br>
        <b>Alamat:</b> <%= request.getAttribute("alamat") %>
    </div>

    <div class="section">
        <b>Tanggal Mulai:</b> <%= request.getAttribute("tanggalMulai") %><br>
        <b>Tanggal Kembali:</b> <%= request.getAttribute("tanggalKembali") %>
    </div>

    <div class="total">
        Total Bayar: Rp <%= request.getAttribute("totalBayar") %>
    </div>

    <!-- FORM PEMBAYARAN -->
    <form method="post" action="<%= request.getContextPath() %>/Success">

        <label>
            <input type="radio" name="metode" value="QRIS"
                   onclick="pilihPembayaran('QRIS')" required>
            QRIS
        </label><br>

        <label>
            <input type="radio" name="metode" value="Tunai"
                   onclick="pilihPembayaran('Tunai')">
            Tunai
        </label>

        <!-- QRIS -->
        <div id="qrisBox" class="pay-box">
            <p><b>Scan QRIS di bawah ini</b></p>
            <img src="<%= request.getContextPath() %>/images/qriss.jpg">
            <button type="submit">Saya Sudah Bayar</button>
        </div>

        <!-- TUNAI -->
        <button id="submitBtn" type="submit" style="display:none;">
            Konfirmasi & Selesai
        </button>
    </form>

</div>

</body>
</html>


