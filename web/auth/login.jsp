<%-- 
    Document   : Login
    Created on : Dec 29, 2025, 10:51:12 AM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #e8f5f5;
            font-family: Arial, sans-serif;
        }
        .login-box {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            text-align: center;
        }
        h2 {
            color: #0c6452;
            margin-bottom: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #aaa;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #0c6452;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .error {
            color: red;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>Login</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/Login">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit" href="/Dashboard" >Masuk</button>
    </form>
        
        <!-- PATH BALIK  -->
    <a class="btn-back" href="<%= request.getContextPath() %>/Home">
        ← Kembali ke Beranda
    </a>
</div>

</body>
</html>

