package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Product;


@WebServlet("/admin/products/delete")
public class ProductDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        List<Product> products =
            (List<Product>) req.getSession().getAttribute("products");

        products.removeIf(p -> p.getId() == id);

        res.sendRedirect(req.getContextPath() + "/admin/products");
    }
}
