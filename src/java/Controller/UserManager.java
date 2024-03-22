
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
import java.util.List;


@WebServlet(name = "UserManager", urlPatterns = {"/usermanager"})
public class UserManager extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO a = new AccountDAO();
        List<Account> list = a.getAllAcc();
        request.setAttribute("list", list);
        request.getRequestDispatcher("usermanager.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        String id = request.getParameter("id");
        AccountDAO a = new AccountDAO();
        
        
        int role1 = Integer.parseInt(role);
        int aid = Integer.parseInt(id);
        
            
        a.updateRole(role1, aid);

        response.sendRedirect("usermanager");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
