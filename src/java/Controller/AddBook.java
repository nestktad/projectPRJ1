package Controller;

import DAO.BookDAO;
import Models.Book;
import Models.Category;
import Models.Publisher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name = "AddBook", urlPatterns = {"/addbook"})
public class AddBook extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
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
        List<Book> list = b.getAllBook();
        List<Category> listC = b.getAllCategory();
        List<Publisher> listP = b.getAllPublisher();

        try {
            Book book = b.getBookByBid(bid);
            if (book != null) {
                String error = "name " + bname + " existed!!!";
                request.setAttribute("listB", list);
                request.setAttribute("listC", listC);
                request.setAttribute("listP", listP);
                request.setAttribute("error", error);
                request.getRequestDispatcher("error.jsp").forward(request, response);
                
            } else {
                if(bname.equals("")){
                response.sendRedirect("manager");
                }else{
                b.insert(category, bname, author, image, publisher, quantity, describe, price);
                response.sendRedirect("manager"); }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
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
