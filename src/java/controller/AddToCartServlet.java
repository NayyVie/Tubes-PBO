package controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

import model.CartItem;
import db.DBConnection;

@WebServlet("/AddToCart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("product_id"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        HttpSession session = request.getSession();
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem item : cart) {
            if (item.getProductId() == productId) {
                item.setQty(item.getQty() + qty);
                found = true;
                break;
            }
        }

        if (!found) {
            String sql = "SELECT * FROM products WHERE id=?";

            try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
            ) {
                ps.setInt(1, productId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        cart.add(new CartItem(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getInt("price"),
                            qty
                        ));
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/Sewa");
    }
}
