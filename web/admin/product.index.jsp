<%-- 
    Document   : product.index
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Data Produk</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3fbfb;
            margin: 0;
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
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            color: #0c6452;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background: #e0f2ef;
        }
        .btn {
            padding: 7px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-size: 13px;
            margin-right: 5px;
        }
        .btn-add {
            background: #0c6452;
        }
        .btn-edit {
            background: #f0ad4e;
        }
        .btn-delete {
            background: #dc3545;
            border: none;
            cursor: pointer;
        }
        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        img {
            border-radius: 8px;
        }
    </style>
</head>
<body>

<header>
    <h2>Admin Panel - Produk</h2>
    <a href="<%= request.getContextPath() %>/Dashboard" class="btn btn-add">
        Dashboard
    </a>
</header>

<div class="container">

    <div class="top-actions">
        <h2>Data Produk</h2>
        <a href="<%= request.getContextPath() %>/admin/products/create"
           class="btn btn-add">
            + Tambah Produk
        </a>
    </div>

    <table>
        <tr>
            <th>No</th>
            <th>Foto</th>
            <th>Nama Produk</th>
            <th>Harga / Hari</th>
            <th>Aksi</th>
        </tr>

        <%
            List<Product> products =
                (List<Product>) request.getAttribute("products");

            if (products == null || products.isEmpty()) {
        %>
        <tr>
            <td colspan="6" style="text-align:center;">
                Belum ada produk
            </td>
        </tr>
        <%
            } else {
                int no = 1;
                for (Product p : products) {
        %>
        <tr>
            <td><%= no++ %></td>
            <td>
                <img src="<%= request.getContextPath() %>/images/products/<%= p.getImage() %>"
                     width="80">
            </td>
            <td><%= p.getName() %></td>
            <td>Rp <%= p.getPrice() %></td>
            <td><%= p.getDescription() != null ? p.getDescription() : "-" %></td>
            <td>
                <a class="btn btn-edit"
                    href="<%= request.getContextPath() %>/admin/products/edit?id=<%= p.getId() %>">
                     Edit
                </a>


               <form action="<%= request.getContextPath() %>/admin/products/delete"
                    method="post" style="display:inline;"
                    onsubmit="return confirm('Yakin hapus produk ini?')">

                  <input type="hidden" name="id" value="<%= p.getId() %>">

                  <button class="btn btn-delete" type="submit">
                      Delete
                  </button>
              </form>

            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

</div>

</body>
</html>
