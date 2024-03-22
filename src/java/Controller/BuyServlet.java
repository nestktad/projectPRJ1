package Controller;

import DAO.*;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.*;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name="BuyServlet", urlPatterns={"/buy"})
public class BuyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String num=request.getParameter("num");
        String id=request.getParameter("bid");
        if(txt.isEmpty()){
            txt=id+":"+num;
        }else{
            txt=txt+"/"+id+":"+num;//thay / cho dau ,
        }
        Cookie c=new Cookie("cart", txt);
        c.setMaxAge(2*24*60*60);
        response.addCookie(c);
        response.sendRedirect("detail?bid="+id);//thay cai duoi
        //request.getRequestDispatcher("shop").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
