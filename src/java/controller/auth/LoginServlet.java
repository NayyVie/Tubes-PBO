
package controller.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/auth/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // LOGIN DUMMY (UNTUK TUBES)
        if ("admin".equals(username) && "admin123".equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");

            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");

        } else {
            request.setAttribute("error", "Username atau password salah");
            request.getRequestDispatcher("/auth/login.jsp")
                   .forward(request, response);
        }
    }
}