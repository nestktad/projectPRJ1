
package Controller;

import DAO.BookDAO;
import Models.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "SignUp", urlPatterns = {"/signup"})
public class SignUp extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        

        

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        BookDAO b = new BookDAO();
        Account a = b.checkAcc(email);
        if (!pass.equals(repass)) {
            String error2 = "Repassword wrong!!";
            request.setAttribute("error2", error2);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (a == null) {
                String error3 = "Registered Successfully !!";
                b.Signup(username, email, pass, null,null,null);
                request.setAttribute("error3", error3);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                String error1 = "Email has registed!!";

                request.setAttribute("error1", error1);
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
    }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
