

package Controller;

import DAO.BookDAO;
import Models.Book;
import Models.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name="SortPriceAsc", urlPatterns={"/sortasc"})

public class SortPriceAsc extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortPriceAsc</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortPriceAsc at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String cID = request.getParameter("cid");
        BookDAO b = new BookDAO();
        List<Book> listCid = b.getBookByCid(cID);
        List<Book> list = b.getBookByPriceLow();
        List<Category> listC = b.getAllCategory();
        
        request.setAttribute("listB", list);
        request.setAttribute("listCid", listCid);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
