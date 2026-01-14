<%-- 
    Document   : transactions
    Created on : Dec 29, 2025, 10:57:48 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <title>Riwayat Penyewaan</title>
    <style>
        body { font-family: Arial; background:#f4f6f8; padding:40px; }
        table { width:100%; border-collapse: collapse; background:white; }
        th, td { padding:12px; border-bottom:1px solid #ddd; }
        th { background:#0c6452; color:white; }
    </style>
</head>

<body>

<h2>Riwayat Penyewaan (1 Bulan Terakhir)</h2>

<table>
<tr>
    <th>Nama</th>
    <th>Tanggal Sewa</th>
    <th>Tanggal Kembali</th>
    <th>Produk</th>
    <th>Metode</th>
    <th>Total</th>
</tr>

<%
    List<Map<String, Object>> history =
        (List<Map<String, Object>>) request.getAttribute("history");

    if (history != null) {
        for (Map<String, Object> t : history) {
%>
<tr>
    <td><%= t.get("nama") %></td>
    <td><%= t.get("pinjam") %></td>
    <td><%= t.get("kembali") %></td>
    <td><%= t.get("produk") %></td>
    <td><%= t.get("metode") %></td>
    <td>Rp <%= t.get("total") %></td>
</tr>
<%
        }
    }
%>

<a class="btn-back" href="<%= request.getContextPath() %>/Dashboard">
        ← Kembali ke Dashboard
    </a>


</table>

</body>
</html>
