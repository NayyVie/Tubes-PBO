<%-- 
    Document   : success
    Created on : Dec 29, 2025, 11:14:49 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sewa Berhasil</title>
    <style>
        body {
            background:#eaf4f2;
            font-family:Arial;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }
        .success {
            background:white;
            padding:40px;
            border-radius:14px;
            text-align:center;
            box-shadow:0 10px 30px rgba(0,0,0,.1);
        }
        h2 { color:#0c6452; }
        a {
            display:inline-block;
            margin-top:20px;
            padding:12px 25px;
            background:#0c6452;
            color:white;
            border-radius:25px;
            text-decoration:none;
            font-weight:bold;
        }
    </style>
</head>

<body>
<div class="success">
    <h2>Penyewaan Berhasil!</h2>
    <p>Terima kasih telah menyewa di <b>Veilside Adventure</b></p>
    <a href="<%= request.getContextPath() %>/Home">Kembali ke Beranda</a>
</div>
</body>
</html>

