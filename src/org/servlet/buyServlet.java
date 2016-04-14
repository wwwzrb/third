package org.servlet;

/**
 * Created by wcy on 2016/4/10.
 */
import javax.servlet.*;
import javax.servlet.http.*;
import org.model.*;
import org.dao.*;

import java.io.IOException;

public class buyServlet extends javax.servlet.http.HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,
            IOException{
        request.setCharacterEncoding("gb2312");
        SigninDao signinDao=new SigninDao();
        HttpSession session=request.getSession();
        String id=((user)session.getAttribute("buy")).getId();
        String [] buys=request.getParameterValues("item");
        if(buys!=null){
            for(String item:buys){
                if(item.equals("0"))
                {
                    signinDao.updateShop(id,item);
                }
                else if(item.equals("1")){
                    signinDao.updateShop(id,item);
                }
                else if(item.equals("2")){
                    signinDao.updateShop(id,item);
                }
            }
        }
        response.sendRedirect("user.jsp");
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,
            IOException{
        doGet(request,response);
    }
}
