
package Controller;

import DAO.BookDAO;
import Models.Book;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author lenam
 */

@WebServlet (name="Detail",urlPatterns={"/detail"})

public class Detail extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String bid = request.getParameter("bid");
        BookDAO bookdao = new BookDAO();
        Book b = bookdao.getBookByBid(bid);       
        
        request.setAttribute("detail", b);

        request.getRequestDispatcher("detail.jsp").forward(request, response);
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String bid = request.getParameter("bid");
        BookDAO bookdao = new BookDAO();
        Book b = bookdao.getBookByBid(bid);       
        
        request.setAttribute("detail", b);

        request.getRequestDispatcher("detail.jsp").forward(request, response);
        
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
