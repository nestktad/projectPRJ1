
package Controller;

import DAO.BookDAO;
import Models.Book;
import Models.Category;
import Models.Publisher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author lenam
 */
@WebServlet(name="Manager", urlPatterns={"/manager"})
public class Manager extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Manager</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Manager at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
            BookDAO b = new BookDAO();
           List<Book> list = b.getAllBook();
           List<Category> listC = b.getAllCategory();
           List<Publisher> listP = b.getAllPublisher();
           
           request.setAttribute("listB", list);
           request.setAttribute("listC", listC);
           request.setAttribute("listP", listP);
           request.getRequestDispatcher("manager.jsp").forward(request, response);
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
