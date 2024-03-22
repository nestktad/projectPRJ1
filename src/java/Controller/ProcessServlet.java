
package Controller;

import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.*;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name="ProcessServlet", urlPatterns={"/process"})
public class ProcessServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO b=new BookDAO();
        List<Book> list=b.getAllBook();
        Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart=new Cart(txt, list);
        String num_raw=request.getParameter("num");
        String bid=request.getParameter("bid");
        int num;
        int id;
        try{
            id=Integer.parseInt(bid);
            Book p = b.getBookByBid(bid);
            int numStore=p.getQuantity();
            num=Integer.parseInt(num_raw);
            if(num==-1&&(cart.getQuantityById(id)<=1)){
                cart.removeItem(id);
            }
            else{
                if((num==1) && cart.getQuantityById(id)>=numStore){
                    num=0;
                }
                float price=p.getPrice()*2;
                Item t=new Item(p, num, price);
                cart.addItem(t);
            }
        }catch(NumberFormatException e){
            
        }
        List<Item> items=cart.getItems();
        txt="";
        if(items.size()>0){
            txt=items.get(0).getBook().getBid()+":"+
                    items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt+="/"+items.get(i).getBook().getBid()+":"+
                    items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2*24*60*60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO b=new BookDAO();
        List<Book> list=b.getAllBook();
        Cookie[] arr=request.getCookies();
        String txt="";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String id=request.getParameter("bid");
        String[] ids=txt.split("/");
        String out="";
        for (int i = 0; i < ids.length; i++) {
            String[] s=ids[i].split(":");
            if(!s[0].equals(id)){
                if(out.isEmpty()){
                    out=ids[i];
                }else{
                    out+="/"+ids[i];
                }
            }
        }
        if(!out.isEmpty()){
            Cookie c=new Cookie("cart", out);
            c.setMaxAge(2*24*60*60);
            response.addCookie(c);
        }
        Cart cart=new Cart(out, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
