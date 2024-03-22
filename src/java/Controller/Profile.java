
package Controller;

import DAO.AccountDAO;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "Profile", urlPatterns = {"/profile"})
public class Profile extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Profile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Profile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aid = request.getParameter("id");
        AccountDAO a = new AccountDAO();
        Account listAid = a.getAccountById(aid);

        request.setAttribute("listAid", listAid);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");

        AccountDAO a = new AccountDAO();

        a.updateInfo(username, pass, phone, address, avatar, id);

        response.sendRedirect("home");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
