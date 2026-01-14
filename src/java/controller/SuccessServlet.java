package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import db.DBConnection;

@WebServlet("/Success")
public class SuccessServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("nama");
        String produk = request.getParameter("produk");
        String tanggalMulai = request.getParameter("tanggal_mulai");
        String tanggalKembali = request.getParameter("tanggal_kembali");
        String metode = request.getParameter("metode");
        int totalBayar = Integer.parseInt(request.getParameter("total_bayar"));

        String sql = "INSERT INTO transactions "
                + "(nama_penyewa, produk, tanggal_pinjam, tanggal_kembali, metode_pembayaran, total_bayar) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, nama);
            ps.setString(2, produk);
            ps.setDate(3, java.sql.Date.valueOf(tanggalMulai));
            ps.setDate(4, java.sql.Date.valueOf(tanggalKembali));
            ps.setString(5, metode);
            ps.setInt(6, totalBayar);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/success.jsp");
    }
}
