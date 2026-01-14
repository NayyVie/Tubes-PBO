<%-- 
    Document   : product_create
    Created on : Dec 29, 2025, 10:57:27 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Tambah Produk</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3fbfb;
            margin: 0;
        }
        header {
            background: #0c6452;
            padding: 20px;
            color: white;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #0c6452;
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #0c6452;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 25px;
        }
        .btn-back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            text-decoration: none;
        }
    </style>
</head>
<body>

<header>
    <h2>Admin Panel</h2>
</header>

<div class="container">
    <h2>Tambah Produk Baru</h2>

    <!-- ACTION DITAMBAHKAN  -->
    <form method="post"
          enctype="multipart/form-data"
          action="<%= request.getContextPath() %>/admin/products/create">

        <label>Nama Produk</label>
        <input type="text" name="name" required>

        <label>Harga / Hari</label>
        <input type="number" name="price" required>
        
        <label>Foto</label>
        <input type="file" name="image" required>

        <button type="submit">Simpan Produk</button>
    </form>

    <a class="btn-back" href="<%= request.getContextPath() %>/admin/products">
        ← Kembali ke Data Produk
    </a>
</div>

</body>
</html>
