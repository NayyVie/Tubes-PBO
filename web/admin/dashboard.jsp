<%-- 
    Document   : dashboard
    Created on : Dec 29, 2025, 10:56:56 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // =========================

    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || role == null || !role.equals("admin")) {
        response.sendRedirect(request.getContextPath() + "/Login");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3fbfb;
        }
        header {
            background: #0c6452;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            padding: 30px;
        }
        .card {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }
        button {
            background: #0c6452;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .logout {
            background: #d9534f;
        }
        form {
            display: inline;
        }
    </style>
</head>
<body>

<header>
    <h2>Admin Panel - <%= username %></h2>

    <!-- Logout -->
    <form action="<%= request.getContextPath() %>/logout" method="get">
        <button type="submit" class="logout">Logout</button>
    </form>
</header>

<div class="container">

    <!-- untuk mengelola produk -->
    <div class="card">
        <h3>Kelola Produk</h3>
        <p>Tambah, edit, dan hapus produk penyewaan.</p>
        <form action="<%= request.getContextPath() %>/admin/products" method="get">
            <button type="submit">Masuk</button>
        </form>
    </div>

    <!-- untuk menampilkan Riwayat Transaksi user -->
    <div class="card">
        <h3>Riwayat Transaksi</h3>
        <p>Lihat semua transaksi penyewaan.</p>
        <form action="<%= request.getContextPath() %>/Admin/History" method="get">
            <button type="submit">Lihat</button>
        </form>
    </div>

</div>

</body>
</html>
