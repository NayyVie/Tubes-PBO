/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.List;
import model.CartItem;

@WebServlet("/KonfirmasiSewa")
public class KonfirmasiSewaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        String nama = request.getParameter("penyewa");
        String noHp = request.getParameter("no_hp");
        String alamat = request.getParameter("alamat");
        int lamaSewa = Integer.parseInt(request.getParameter("lama_sewa"));
        LocalDate tanggalMulai = LocalDate.parse(request.getParameter("tanggal_mulai"));
        LocalDate tanggalKembali = tanggalMulai.plusDays(lamaSewa);

        int totalPerHari = 0;
        for (CartItem item : cart) {
            totalPerHari += item.getPrice() * item.getQty();
        }

        int totalBayar = totalPerHari * lamaSewa;

        // =========================
        // SIMPAN KE SESSION (PENTING)
        // =========================
        session.setAttribute("nama", nama);
        session.setAttribute("tanggalMulai", tanggalMulai);
        session.setAttribute("tanggalKembali", tanggalKembali);
        session.setAttribute("lamaSewa", lamaSewa);

        // =========================
        // KIRIM KE JSP (UNTUK TAMPILAN)
        // =========================
        request.setAttribute("nama", nama);
        request.setAttribute("noHp", noHp);
        request.setAttribute("alamat", alamat);
        request.setAttribute("tanggalMulai", tanggalMulai);
        request.setAttribute("tanggalKembali", tanggalKembali);
        request.setAttribute("lamaSewa", lamaSewa);
        request.setAttribute("totalBayar", totalBayar);
        request.setAttribute("cart", cart);

        RequestDispatcher rd = request.getRequestDispatcher("/konfirmasi.jsp");
        rd.forward(request, response);
    }
}