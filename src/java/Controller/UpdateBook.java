
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


@WebServlet(name = "UpdateBook", urlPatterns = {"/updatebook"})
public class UpdateBook extends HttpServlet {


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
        String id = request.getParameter("bid");
        BookDAO b = new BookDAO();
        Book list = b.getBookByBid(id);
        List<Category> listC = b.getAllCategory();
        List<Publisher> listP = b.getAllPublisher();

        request.setAttribute("listB", list);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("updatebook.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String bid = request.getParameter("bid");
        String category = request.getParameter("category");
        String bname = request.getParameter("bname");
        String author = request.getParameter("author");
        String image = request.getParameter("image");
        String publisher = request.getParameter("publisher");
        String quantity = request.getParameter("quantity");
        String describe = request.getParameter("describe");
        String price = request.getParameter("price");

        BookDAO b = new BookDAO();
        int id = Integer.parseInt(bid);
            
          b.update( category,bname, author, image, publisher,quantity, describe, price , id);

        response.sendRedirect("manager");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
