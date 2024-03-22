

package Controller;

import DAO.BookDAO;
import Models.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name="Login", urlPatterns={"/login"})
public class Login extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        BookDAO b = new BookDAO();
        Account a = b.login(email, pass);
        if (a == null) {
            String error = "Wrong email or password";
                
            request.setAttribute("error", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
    
        } else {
            HttpSession session = request.getSession();
            request.getSession().setMaxInactiveInterval(100000);
            
            session.setAttribute("acc", a);
            response.sendRedirect("home");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
