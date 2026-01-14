package controller.admin;

import db.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/Admin/History")
public class TransactionHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> history = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM transactions";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> trx = new HashMap<>();
                trx.put("nama", rs.getString("nama_penyewa"));
                trx.put("pinjam", rs.getDate("tanggal_pinjam"));
                trx.put("kembali", rs.getDate("tanggal_kembali"));
                trx.put("produk", rs.getString("produk"));
                trx.put("metode", rs.getString("metode_pembayaran"));
                trx.put("total", rs.getInt("total_bayar"));

                history.add(trx);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        request.setAttribute("history", history);
        request.getRequestDispatcher("/admin/transactions.jsp")
               .forward(request, response);
    }
}