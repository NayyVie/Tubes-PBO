package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.CartItem;

@WebServlet("/SewaForm")
public class SewaFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("Sewa");
            return;
        }

        int total = 0;
        for (CartItem item : cart) {
            total += item.getSubtotal();
        }

        request.setAttribute("cart", cart);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/sewaform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("penyewa");
        String hp = request.getParameter("no_hp");
        String alamat = request.getParameter("alamat");
        int lama = Integer.parseInt(request.getParameter("lama_sewa"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        int total = 0;
        for (CartItem item : cart) {
            total += item.getSubtotal();
        }

        int totalAkhir = total * lama;

        session.removeAttribute("cart");
        session.setAttribute("totalAkhir", totalAkhir);

        response.sendRedirect("Success");
    }
}
